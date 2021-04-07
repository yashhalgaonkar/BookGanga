import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: 50.0,
      floating: false,
      pinned: true,
      elevation: 10.0,
      centerTitle: true,
      leading: Icon(
        Icons.format_quote_sharp,
        color: BookGanga.kDarkBlack,
        size: 24.0,
      ),
      backgroundColor: BookGanga.scaffold,
      title: Text(
        'Book Ganga',
        style: const TextStyle(
            color: BookGanga.kDarkBlack,
            fontSize: 24.0,
            letterSpacing: -0.2,
            fontFamily: 'Nunito',
            fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
          color: BookGanga.kDarkBlack,
        ),
        IconButton(
          icon: Icon(Icons.people),
          onPressed: () {},
          color: BookGanga.kDarkBlack,
        ),
      ],
    );
  }
}
