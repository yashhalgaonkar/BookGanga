import 'package:flutter/material.dart';

class BookGanga {
  static AppBar kAppBar = AppBar(
    toolbarHeight: 50.0,
    titleSpacing: 2.0,
    centerTitle: true,
    backgroundColor: Colors.white,
    title: Text(
      'Book Ganga',
      style: TextStyle(
        color: Colors.black,
        fontSize: 30.0,
        fontFamily: 'Pacifico',
      ),
    ),
  );

  static TextStyle kHeadingStyle = TextStyle(
    fontSize: 24.0,
    color: Colors.black,
    fontFamily: 'Nunito',
    fontWeight: FontWeight.w800,
  );

  static TextStyle kSubHeadingStyle = TextStyle(
    color: Colors.red,
    fontWeight: FontWeight.bold,
    fontSize: 12.0,
    fontFamily: 'Nunito',
  );
}
