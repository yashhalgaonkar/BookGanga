import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      forceElevated: true,
      elevation: 4.0,
      centerTitle: true,
      leading: Icon(
        Icons.format_quote_sharp,
        color: BookGanga.kDarkBlack,
        size: 30.0,
      ),
      backgroundColor: BookGanga.scaffold,
      title: Text(
        'Book Ganga',
        style: const TextStyle(
          color: BookGanga.kDarkBlack,
          fontSize: 30.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
