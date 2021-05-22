import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/ui/widgets/error_widget.dart';
import 'package:book_ganga/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class DiscoverBooksScreen extends StatefulWidget {
  @override
  _DiscoverBooksScreenState createState() => _DiscoverBooksScreenState();
}

class _DiscoverBooksScreenState extends State<DiscoverBooksScreen> {
  Future<List<Book>> _future;

  @override
  void initState() {
    super.initState();
    //TODO: inilizlise the future
  }

  

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1;
    return SafeArea(
      child: FutureBuilder<List<Book>>(
        future: _future,
        // ignore: missing_return
        builder: (BuildContext context, AsyncSnapshot<List<Book>> books) {
          if (true) {
            // check the connection state
            if (false) // book.hasError
              return MyErrorWidget(onRefresh: () => print('Refreshed'));
            else
              return Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  title: Text('Discover Books', style: BookGanga.titleStyle),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Column(
                    children: [
                      //* Input Field
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: MyInputField(),
                      ),

                      //* Dixcover New section
                      Container(
                        margin: EdgeInsets.only(top: 230, left: 30),
                        height: 360.0,
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  spreadRadius: 10,
                                  blurRadius: 20)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    'Discover new',
                                    style: style.copyWith(
                                        fontSize: 30, color: Colors.black),
                                  ),
                                  GestureDetector(
                                    // onTap: () => Navigator.pushNamed(
                                    //   context,
                                    //   PageRouter.seeAllBooksPage,
                                    // ),
                                    child: Text(
                                      'see all',
                                      style: style.copyWith(color: BookGanga.kAccentColor),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Hunt new books before other bookworms do it',
                                style: style.copyWith(color: Colors.black54),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              LimitedBox(
                                maxHeight: 230.0,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: books.data.length ?? 0,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          FocusedMenuHolder(
                                    menuWidth: 170,
                                    menuItems: <FocusedMenuItem>[
                                      FocusedMenuItem(
                                          title: Text('Add to wish list',
                                              style: style.copyWith(
                                                  color: Colors.black)),
                                          onPressed: () {
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
                                            'Add to read next',
                                            style: style.copyWith(
                                                color: Colors.black),
                                          ),
                                          onPressed: () {
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
                                    // onPressed: () => Navigator.pushNamed(
                                    //     context, PageRouter.bookPage,
                                    //     arguments: BookPageArguments(
                                    //         book: books[index],
                                    //         fromLibrary: false,
                                    //         bookList: books,
                                    //         index: index)),
                                    child: FittedBox(
                                      fit: BoxFit.contain,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              height: 150,
                                              width: 100,
                                              child: Image.network(
                                                books.data[index].imgUrl,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 20,
                                            ),
                                            Text(
                                              books.data[index].author.length > 20
                                                  ? '${books.data[index].author.substring(0, 20)}...'
                                                  : books.data[index].author,
                                              style: style.copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 12),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              books.data[index].title.length > 15
                                                  ? '${books.data[index].title.substring(0, 15)}...'
                                                  : books.data[index].title,
                                              style: style.copyWith(
                                                  color: Colors.black,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
          } else
            return LoadingWidget();
        },
      ),
    );
  }
}

class MyInputField extends StatelessWidget {
  const MyInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BookGanga.kLightGreyColor),
      child: Stack(
        children: <Widget>[
          TextField(
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 12.0, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, bottom: 10),
              border: InputBorder.none,
              hintText: 'Search book..',
              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: BookGanga.kGrey,
                  ),
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BookGanga.kAccentColor.withOpacity(0.8),
                ),
              )),
          Positioned(
            top: 8,
            right: 9,
            // child: SvgPicture.asset(
            //     'assets/icons/icon_search_white.svg'),
            child: Icon(LineIcons.search, color: Colors.white),
          )
        ],
      ),
    );
  }
}
