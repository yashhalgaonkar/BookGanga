import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:book_ganga/viewmodels/user_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

class WishListList extends StatefulWidget {
  @override
  _WishListListState createState() => _WishListListState();
}

class _WishListListState extends State<WishListList> {
  Future<List<Book>> _futureBooks;
  final UserProfileVM _userProfileVM = GetIt.I<UserProfileVM>();

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  void getBooks() {
    _futureBooks = _userProfileVM.getBookSelfForUser('dummy_username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => Fluttertoast.showToast(msg: "Add book to Wish List"),
        backgroundColor: BookGanga.kAccentColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Book>>(
          future: _futureBooks,
          builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final books = snapshot.data;
                return Column(
                  children: [
                    Container(
                      height: 60,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(LineIcons.book),
                          const SizedBox(width: 5),
                          Text(
                            '${books.length}',
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      child: MyInputField(),
                    ),
                    Expanded(
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(
                            parent: AlwaysScrollableScrollPhysics()),
                        shrinkWrap: true,
                        itemCount: books.length,
                        itemBuilder: (BuildContext context, int index) {
                          final book = books[index];
                          return ListTile(
                            onTap: () => print('Tapped'),
                            title: Text(
                              book.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text(book.author),
                            leading: CachedNetworkImage(
                              height: 80,
                              width: 60,
                              imageUrl: book.imgUrl,
                            ),
                          );
                        },
                      ),
                    )
                  ],
                );
              } else
                return MyErrorWidget(
                    errorMessage: snapshot.error, onRefresh: getBooks);
            } else
              return LoadingWidget();
          }),
    );
  }
}
