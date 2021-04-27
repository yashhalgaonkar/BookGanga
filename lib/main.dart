import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/core/injector.dart';
import 'package:book_ganga/ui/screens/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/cubit/user_profile_screen_cubit.dart';
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
          bodyText1: GoogleFonts.lato(color: BookGanga.kDarkBlack),
          // for blog view screen
          bodyText2: GoogleFonts.lato(color: BookGanga.kGrey),
        ),
        iconTheme: IconThemeData(color: BookGanga.kDarkBlack, size: 25.0),
        accentColor: BookGanga.kAccentColor,
        brightness: Brightness.light,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<HomeScreenCubit>(create: (_) => HomeScreenCubit()),
          BlocProvider<UserProfileScreenCubit>(
              create: (_) => UserProfileScreenCubit()),
          //* add new cubits here to provide the thoughout the app
        ],
        child: NavScreen(),
      ),
    );
  }
}
