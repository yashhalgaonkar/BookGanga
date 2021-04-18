import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/core/injector.dart';
import 'package:book_ganga/ui/screens/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'ui/screens/screens.dart';

void main() {
  initializeDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookGanga',
      theme: ThemeData(
        scaffoldBackgroundColor: BookGanga.scaffold,
        textTheme: TextTheme(
          //for normal texts
          bodyText1: GoogleFonts.raleway(color: BookGanga.kDarkBlack, fontWeight: FontWeight.w600),
          // for blog view screen
          bodyText2: GoogleFonts.merriweather(color: BookGanga.kDarkBlack),
        ),
        iconTheme: IconThemeData(color: BookGanga.kDarkBlack, size: 25.0),
        accentColor: BookGanga.kAccentColor,
        brightness: Brightness.light,
        bottomAppBarColor: Colors.white,
      ),
      home: BlocProvider(
        create: (context) => HomeScreenCubit(),
        child: NavScreen(),
      ),
    );
  }
}
