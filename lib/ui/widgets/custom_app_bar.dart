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
      centerTitle: true,
      leading: Icon(
        Icons.format_quote_sharp,
      ),
      backgroundColor: Colors.black,
      title: Text(
        'Book Ganga',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 24.0,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
