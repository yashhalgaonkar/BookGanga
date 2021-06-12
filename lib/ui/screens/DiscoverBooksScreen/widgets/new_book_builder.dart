import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/pages/book_profile_screen.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/pages/see_all_books_screen.dart';
import 'package:book_ganga/ui/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:line_icons/line_icons.dart';

class NewBooksBuilder extends StatelessWidget {
  final String sectionTitle;
  final String sectionSubtitle;
  final List<Book> books;
  final GlobalKey<ScaffoldState> scaffoldKey;
  final bool alignLeft;

  NewBooksBuilder({
    @required this.books,
    @required this.sectionTitle,
    this.sectionSubtitle,
    this.alignLeft = false,
    this.scaffoldKey,
  });

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1;
    return Container(
      margin: EdgeInsets.only(
          bottom: 30,
          left: alignLeft ? 30.0 : 0.0,
          right: !alignLeft ? 30.0 : 0.0),
      //height: 360.0,
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: alignLeft
              ? BorderRadius.only(
                  topLeft: Radius.circular(30), bottomLeft: Radius.circular(30))
              : BorderRadius.only(
                  topRight: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 10, blurRadius: 20)
          ]),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                //* Section Title
                Text(
                  sectionTitle,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 18.0, fontWeight: FontWeight.w600),
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => SeeAllBooksPage())),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: BookGanga.kAccentColor),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              sectionSubtitle,
              style: Theme.of(context).textTheme.bodyText2,
            ),
            const SizedBox(
              height: 10,
            ),
            LimitedBox(
              maxHeight: 250.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: books.length ?? 0,
                itemBuilder: (BuildContext context, int index) =>
                    FocusedMenuHolder(
                  menuWidth: 170,
                  menuItems: <FocusedMenuItem>[
                    FocusedMenuItem(
                        title: Text('Add to wish list',
                            style: Theme.of(context).textTheme.bodyText1),
                        onPressed: () {
                          //todo : complete add to wishlist
                          Fluttertoast.showToast(msg: "Added to the Wish List");
                          // _addToWishList(
                          //     index: index,
                          //     style: style,
                          //     wishlistNotifier: _wishlistNotifier,
                          //     firestore: _firestore);
                        },
                        trailingIcon: Icon(
                          LineIcons.bookmark,
                          size: 16,
                        )),
                    FocusedMenuItem(
                        title: Text(
                          'Add to Book Shelf',
                          style: Theme.of(context).textTheme.bodyText1,
                        ),
                        onPressed: () {
                          //todo: complete add to book shelf
                          Fluttertoast.showToast(msg: "Added to the Book Shelf");
                          // _addToReadingList(
                          //     index: index,
                          //     style: style,
                          //     readingNotifier: _readingNotifier,
                          //     firestore: _firestore);
                        },
                        trailingIcon: Icon(
                          LineIcons.book,
                          size: 16,
                        )),
                  ],
                  onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (_) => BookProfileScreen(
                              book: books[index],
                              index: index,
                              bookList: books,
                              fromLibrary: true))),
                  child: _BookTile(book: books[index]),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  /*
  Future<Null> _addToWishList(
      {FirebaseFirestore firestore,
      TextStyle style,
      int index,
      ValueNotifier wishlistNotifier}) async {
    var user = FirebaseAuth.instance.currentUser;
    return await firestore
        .collection(UsersCollection)
        .doc(user.uid)
        .collection(WishListCollection)
        .get()
        .then((snapshot) {
      for (var ds in snapshot.docs) {
        if (ds.data()['imgUrl'] == books[index].imgUrl) {
          wishlistNotifier.value = Document.present;
          break;
        } else {
          wishlistNotifier.value = Document.absent;
        }
      }
      if (wishlistNotifier.value == Document.present) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Book already exist',
            style: style.copyWith(color: Colors.white),
          ),
          backgroundColor: kDarkBlue,
          duration: Duration(seconds: 1),
        ));
      } else {
        firestore
            .collection(UsersCollection)
            .doc(user.uid)
            .collection(WishListCollection)
            .add({
          'title': books[index].title,
          'author': books[index].author,
          'imgUrl': books[index].imgUrl,
          'language': books[index].language,
          'pages': books[index].pages,
          'desc': books[index].desc,
          'category': books[index].category
        });
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Added to wishlist',
            style: style.copyWith(color: Colors.white),
          ),
          backgroundColor: kDarkBlue,
          duration: Duration(seconds: 1),
        ));
      }
    });
  }

  Future<Null> _addToReadingList(
      {FirebaseFirestore firestore,
      TextStyle style,
      int index,
      ValueNotifier readingNotifier}) async {
    var user = FirebaseAuth.instance.currentUser;
    return await firestore
        .collection(UsersCollection)
        .doc(user.uid)
        .collection(ReadingCollection)
        .get()
        .then((snapshot) {
      for (var ds in snapshot.docs) {
        if (ds.data()['imgUrl'] == books[index].imgUrl) {
          readingNotifier.value = Document.present;
          break;
        } else {
          readingNotifier.value = Document.absent;
        }
      }
      if (readingNotifier.value == Document.present) {
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Book already exist',
            style: style.copyWith(color: Colors.white),
          ),
          backgroundColor: kDarkBlue,
          duration: Duration(seconds: 1),
        ));
      } else {
        firestore
            .collection(UsersCollection)
            .doc(user.uid)
            .collection(ReadingCollection)
            .add({
          'title': books[index].title,
          'author': books[index].author,
          'imgUrl': books[index].imgUrl,
          'language': books[index].language,
          'pages': books[index].pages,
          'desc': books[index].desc,
          'category': books[index].category
        });
        scaffoldKey.currentState.showSnackBar(SnackBar(
          content: Text(
            'Added to reading list',
            style: style.copyWith(color: Colors.white),
          ),
          backgroundColor: kDarkBlue,
          duration: Duration(seconds: 1),
        ));
      }
    });
  }*/
}

class _BookTile extends StatelessWidget {
  const _BookTile({
    Key key,
    @required this.book,
  }) : super(key: key);

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          CachedNetworkImage(
              height: 150.0,
              width: 100.0,
              placeholder: (context, url) => LoadingWidget(),
              imageUrl: book.imgUrl,
              fit: BoxFit.fill),
          const SizedBox(
            height: 10,
          ),
          //* Book Title
          Text(
            book.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style:
                Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16.0),
          ),
          const SizedBox(
            height: 5,
          ),
          //* author name
          Text(
            book.author,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ],
      ),
    );
  }
}
