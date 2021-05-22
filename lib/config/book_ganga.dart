import 'package:flutter/material.dart';

class BookGanga {
  // static TextStyle kHeadingStyle = TextStyle(
  //   fontSize: 25.0,
  //   color: Colors.black,
  //   fontWeight: FontWeight.w700,
  // );

  static const Color scaffoldGrey = Color(0xFFF0F2F5);
  static const Color scaffold = Colors.white;

  // static const Color kAccentColor = Color(0xFF26A69A);

  // static const Color GoodAccentColor = Color(0xff4abae3);

  // static const Color selectionColor = Colors.black;

  //* Most popular colous pallet - COlorHunt.co
  static const Color kDarkBlack = Color(0xff080708);
  static const Color kBlack = Color(0xff393e46);
  static const Color kAccentColor = Color(0xffA663CC);
  static const kLightGreyColor = Color(0xFFF4F4F4);
  //static Color kDimAccentColor = Color(0xff00adb5).withOpacity(0.5);

  //static const Color kGrey = Color(0xffeeeeee);
  //
  static const Color kGrey = Colors.black54;

  static const LinearGradient storyGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black87],
  );

  // static TextStyle titleStyle = GoogleFonts.sacramento(
  //   fontWeight: FontWeight.w700,
  //   fontSize: 32.0,
  //   color: BookGanga.kDarkBlack,
  // );

  static TextStyle titleStyle = const TextStyle(
    fontFamily: 'Sacramento',
    fontSize: 32.0,
    color: kDarkBlack,
    fontWeight: FontWeight.w700,
  );
}
