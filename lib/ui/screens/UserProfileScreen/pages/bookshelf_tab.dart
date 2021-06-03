import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:book_ganga/viewmodels/user_profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

/// This is the list of Books
/// It takes list of books as input
class BookShelfList extends StatefulWidget {
  @override
  _BookShelfListState createState() => _BookShelfListState();
}

class _BookShelfListState extends State<BookShelfList> {
  Future<List<Book>> _futureBooks;
  final UserProfileVM _userProfileVM = GetIt.I<UserProfileVM>();

  @override
  void initState() {
    super.initState();
    _futureBooks = _userProfileVM.getBookSelfForUser('dummy_username');
  }

  @override
  Widget build(BuildContext context) {
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
                '${dummyUser.length}',
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
          child: FutureBuilder<List<Book>>(
            future: _futureBooks,
            builder:
                (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
              if (snapshot.hasData) {
                final books = snapshot.data;
                return ListView.builder(
                  itemCount: dummyUser.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Harry Potter and the Deathly Hallows'),
                      subtitle: Text('J.K Rowling'),
                      leading: CachedNetworkImage(
                        imageUrl:
                            'https://images-na.ssl-images-amazon.com/images/I/71xcuT33RpL._AC_SY879_.jpg',
                      ),
                    );
                  },
                );
              }
              if (snapshot.error) {
                return MyErrorWidget(
                    errorMessage: snapshot.error.toString(), onRefresh: () {});
              } else
                return LoadingWidget();
            },
          ),
        )
      ],
    );
  }
}
