import 'package:book_ganga/data/data.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ClubBookTab extends StatelessWidget {
  const ClubBookTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummyUser.length + 25,
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
}
