import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/services/book_service.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/pages/book_profile_screen.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class SeeAllBooksPage extends StatefulWidget {
  final int category;

  SeeAllBooksPage({this.category = 0});

  _SeeAllBooksPageState createState() => _SeeAllBooksPageState();
}

class _SeeAllBooksPageState extends State<SeeAllBooksPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  ValueNotifier<int> _currentTab;
  TabController _tabController;
  Future<List<List<Book>>> _future;
  final BookService _bookService = GetIt.I<BookService>();

  @override
  void initState() {
    super.initState();
    _currentTab = ValueNotifier<int>(widget.category);
    _tabController =
        TabController(length: 10, vsync: this, initialIndex: widget.category);
    _future = _bookService.fetchBooksAccordingToCategory();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget categoryBuilder({String title, TextStyle style}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Text(
        title,
      ),
    );
  }

  Widget bookBuilder({Book book, int index, List<Book> books}) {
    final TextStyle style = Theme.of(context).textTheme.bodyText1;
    return FocusedMenuHolder(
      menuWidth: 170,
      menuItems: <FocusedMenuItem>[
        FocusedMenuItem(
            title: Text('Add to Book Shelf', style: style),
            onPressed: () {
              //todo: Complete Add to book shelf
              // _addToWishList(
              //     firestore: _firestore,
              //     index: index,
              //     style: style,
              //     wishlistNotifier: _wishlistNotifier,
              //     bookList: books);
            },
            trailingIcon: Icon(
              LineIcons.bookmark,
              size: 16,
            )),
        FocusedMenuItem(
            title: Text('Add to Wish List', style: style),
            onPressed: () {
              //todo: Complete add to wish list
              // _addToReadingList(
              //     firestore: _firestore,
              //     index: index,
              //     style: style,
              //     readingNotifier: _readingNotifier,
              //     bookList: books);
            },
            trailingIcon: Icon(
              LineIcons.book,
              size: 16,
            )),
      ],
      // onPressed: () => Navigator.pushNamed(context, PageRouter.bookPage,
      //     arguments: BookPageArguments(
      //         book: books[index],
      //         fromLibrary: false,
      //         index: index,
      //         bookList: books)),

      //todo: Navigate to BookProfile screen
      onPressed: () => Navigator.of(context).push(MaterialPageRoute(
          builder: (_) => BookProfileScreen(
              book: book, bookList: books, fromLibrary: false, index: index))),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: book.imgUrl,
                height: 140,
                width: 100,
                fit: BoxFit.fill,
              ),
              Text(book.title,
                  style: style, maxLines: 2, overflow: TextOverflow.ellipsis),
            ],
          )),
    );
  }

  Widget tabBody({List<Book> books}) {
    return StaggeredGridView.countBuilder(
      padding: EdgeInsets.symmetric(horizontal: 10).copyWith(bottom: 20),
      itemCount: books.length,
      itemBuilder: (BuildContext context, int index) {
        return bookBuilder(book: books[index], books: books, index: index);
      },
      staggeredTileBuilder: (int index) => StaggeredTile.fit(1),
      mainAxisSpacing: 4.0,
      crossAxisSpacing: 4.0,
      crossAxisCount: 3,
    );
  }

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1;
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                size: 16,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        body: FutureBuilder<List<List<Book>>>(
          future: _future,
          builder: (BuildContext context,
              AsyncSnapshot<List<List<Book>>> listOfBooks) {
            if (listOfBooks.connectionState == ConnectionState.done) {
              if (listOfBooks.hasError) {
                return MyErrorWidget(
                  onRefresh: () => print('Refreshed'),
                  errorMessage: listOfBooks.error.toString(),
                );
              } else {
                return Container(
                  child: Column(
                    children: <Widget>[
                      //* Tab bar
                      TabBar(
                        controller: _tabController,
                        onTap: (index) {
                          _currentTab.value = index;
                        },
                        isScrollable: true,
                        labelStyle: style.copyWith(fontWeight: FontWeight.w600),
                        unselectedLabelStyle: style.copyWith(fontWeight: null),
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black26,
                        indicatorColor: BookGanga.kAccentColor,
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: MaterialIndicator(
                            color: BookGanga.kAccentColor,
                            horizontalPadding: 10.0),
                        indicatorWeight: 4,
                        tabs: [
                          categoryBuilder(title: 'Fiction', style: style),
                          categoryBuilder(title: 'Poetry', style: style),
                          categoryBuilder(title: 'Design', style: style),
                          categoryBuilder(title: 'Cooking', style: style),
                          categoryBuilder(title: 'Nature', style: style),
                          categoryBuilder(title: 'Philosophy', style: style),
                          categoryBuilder(title: 'Education', style: style),
                          categoryBuilder(title: 'Comics', style: style),
                          categoryBuilder(title: 'Health', style: style),
                          categoryBuilder(title: 'Business', style: style),
                        ],
                      ),

                      //* Holding Container with a shadow
                      Expanded(
                        child: Container(
                          margin: EdgeInsets.only(top: 30, left: 20, right: 20),
                          width: double.maxFinite,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    spreadRadius: 10,
                                    blurRadius: 20)
                              ]),
                          child: Column(children: [
                            //searchBar(style),
                            //* Search bar
                            Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: MyInputField(),
                            ),

                            //* Tab bar view with stagerred grid view
                            Expanded(
                              child: TabBarView(
                                controller: _tabController,
                                children: <Widget>[
                                  tabBody(
                                    books: listOfBooks.data[0],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[1],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[2],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[3],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[4],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[5],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[6],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[7],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[8],
                                  ),
                                  tabBody(
                                    books: listOfBooks.data[9],
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        ),
                      ),
                    ],
                  ),
                );
              }
            } else
              return LoadingWidget();
          },
        ),
      ),
    );
  }
}
