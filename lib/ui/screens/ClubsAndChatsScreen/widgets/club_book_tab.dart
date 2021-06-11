import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/ui/widgets/error_widget.dart';
import 'package:book_ganga/ui/widgets/loading_widget.dart';
import 'package:book_ganga/viewmodels/community_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ClubBookTab extends StatefulWidget {
  const ClubBookTab({Key key}) : super(key: key);

  @override
  _ClubBookTabState createState() => _ClubBookTabState();
}

class _ClubBookTabState extends State<ClubBookTab> {
  Future<List<Book>> _futureBooks;
  final CommunityVM _communityVM = GetIt.I<CommunityVM>();

  void getBooks() {
    _futureBooks = _communityVM.getBooksOfClub('dummyClubid');
  }

  @override
  void initState() {
    super.initState();
    getBooks();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Book>>(
      future: _futureBooks,
      builder: (BuildContext context, AsyncSnapshot<List<Book>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final _booksList = snapshot.data;
            return Container(
              child: ListView.builder(
                itemCount: _booksList.length,
                itemBuilder: (BuildContext context, int index) {
                  final book = _booksList[index];
                  return ListTile(
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
            );
          } else
            return MyErrorWidget(
                errorMessage: snapshot.error, onRefresh: getBooks);
        } else
          return LoadingWidget();
      },
    );
  }
}
