import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/book.dart';
import 'package:flutter/material.dart';

class BookPageBottomButtons extends StatelessWidget {
  final bool fromLibrary;
  final List<Book> bookList;
  final int index;
  final GlobalKey<ScaffoldState> scaffoldKey;

  BookPageBottomButtons(
      {this.fromLibrary, this.bookList, this.index, this.scaffoldKey});

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1;
    return fromLibrary
        ? Container()
        : Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: <Widget>[
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 0, left: 20),
                        height: 40,
                        width: double.maxFinite,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 0.5,
                              offset: Offset(2, 2))
                        ]),
                        child: RaisedButton(
                          child: Text(
                            'Add to read next',
                            style: style.copyWith(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            //   _addToReadingList(
                            //       index: index,
                            //       context: context,
                            //       style: style,
                            //       firestore: _firestore,
                            //       readingNotifier: _readingNotifier);
                          },
                          color: BookGanga.kAccentColor,
                        ))),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                    child: Container(
                        margin: EdgeInsets.only(right: 20, left: 0),
                        height: 40,
                        width: double.maxFinite,
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                              color: Colors.black12,
                              blurRadius: 10,
                              spreadRadius: 0.5,
                              offset: Offset(2, 2))
                        ]),
                        child: RaisedButton(
                          child: Text(
                            'Add to wishlist',
                            style: style.copyWith(
                                color: BookGanga.kAccentColor,
                                fontWeight: FontWeight.w600,
                                letterSpacing: 0.5),
                          ),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          onPressed: () {
                            // _addToWishList(
                            //     context: context,
                            //     index: index,
                            //     style: style,
                            //     firestore: _firestore,
                            //     wishlistNotifier: _readingNotifier);
                          },
                          color: Colors.white,
                        ))),
              ],
            ),
          );
  }

  // Future<Null> _addToWishList(
  //     {FirebaseFirestore firestore,
  //     TextStyle style,
  //     int index,
  //     BuildContext context,
  //     ValueNotifier wishlistNotifier}) async {
  //   var user = FirebaseAuth.instance.currentUser;
  //   return await firestore
  //       .collection(UsersCollection)
  //       .doc(user.uid)
  //       .collection(WishListCollection)
  //       .get()
  //       .then((snapshot) {
  //     for (var ds in snapshot.docs) {
  //       if (ds.data()['imgUrl'] == bookList[index].imgUrl) {
  //         wishlistNotifier.value = Document.present;
  //         break;
  //       } else {
  //         wishlistNotifier.value = Document.absent;
  //       }
  //     }
  //     if (wishlistNotifier.value == Document.present) {
  //       scaffoldKey.currentState.showSnackBar(SnackBar(
  //         content: Text(
  //           'Book already exist',
  //           style: style.copyWith(color: Colors.white),
  //         ),
  //         backgroundColor: kDarkBlue,
  //         duration: Duration(seconds: 1),
  //       ));
  //     } else {
  //       firestore
  //           .collection(UsersCollection)
  //           .doc(user.uid)
  //           .collection(WishListCollection)
  //           .add({
  //         'title': bookList[index].title,
  //         'author': bookList[index].author,
  //         'imgUrl': bookList[index].imgUrl,
  //         'language': bookList[index].language,
  //         'pages': bookList[index].pages,
  //         'desc': bookList[index].desc,
  //         'category': bookList[index].category
  //       });
  //       scaffoldKey.currentState.showSnackBar(SnackBar(
  //         content: Text(
  //           'Added to wishlist',
  //           style: style.copyWith(color: Colors.white),
  //         ),
  //         backgroundColor: kDarkBlue,
  //         duration: Duration(seconds: 1),
  //       ));

  //       Future.delayed(Duration(seconds: 1), () {
  //         Navigator.pop(context);
  //       });
  //     }
  //   });
  // }

  // Future<Null> _addToReadingList(
  //     {FirebaseFirestore firestore,
  //     TextStyle style,
  //     int index,
  //     BuildContext context,
  //     ValueNotifier readingNotifier}) async {
  //   var user = FirebaseAuth.instance.currentUser;
  //   return await firestore
  //       .collection(UsersCollection)
  //       .doc(user.uid)
  //       .collection(ReadingCollection)
  //       .get()
  //       .then((snapshot) {
  //     for (var ds in snapshot.docs) {
  //       if (ds.data()['imgUrl'] == bookList[index].imgUrl) {
  //         readingNotifier.value = Document.present;
  //         break;
  //       } else {
  //         readingNotifier.value = Document.absent;
  //       }
  //     }
  //     if (readingNotifier.value == Document.present) {
  //       scaffoldKey.currentState.showSnackBar(SnackBar(
  //         content: Text(
  //           'Book already exist',
  //           style: style.copyWith(color: Colors.white),
  //         ),
  //         backgroundColor: kDarkBlue,
  //         duration: Duration(seconds: 1),
  //       ));
  //     } else {
  //       firestore
  //           .collection(UsersCollection)
  //           .doc(user.uid)
  //           .collection(ReadingCollection)
  //           .add({
  //         'title': bookList[index].title,
  //         'author': bookList[index].author,
  //         'imgUrl': bookList[index].imgUrl,
  //         'language': bookList[index].language,
  //         'pages': bookList[index].pages,
  //         'desc': bookList[index].desc,
  //         'category': bookList[index].category
  //       });
  //       scaffoldKey.currentState.showSnackBar(SnackBar(
  //         content: Text(
  //           'Added to reading list',
  //           style: style.copyWith(color: Colors.white),
  //         ),
  //         backgroundColor: kDarkBlue,
  //         duration: Duration(seconds: 1),
  //       ));
  //       Future.delayed(Duration(seconds: 1), () {
  //         Navigator.pop(context);
  //       });
  //     }
  //   });
  // }
}
