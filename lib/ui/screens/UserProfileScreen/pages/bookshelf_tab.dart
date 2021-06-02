import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

/// This is the list of Books
/// It takes list of books as input
class BookShelfList extends StatelessWidget {
  final List<Book> books;

  BookShelfList({this.books});

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
          child: ListView.builder(
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
          ),
        )
      ],
    );
  }
}
