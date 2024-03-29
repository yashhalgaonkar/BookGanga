import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/core/injector.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/cubit/discoverbooks_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'ui/screens/screens.dart';

void main() {
  initializeDependencies();
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: BookGanga.kLightGreyColor),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'BookGanga',
      theme: ThemeData(
        scaffoldBackgroundColor: BookGanga.scaffold,
        textTheme: TextTheme(
          //for normal texts
          // bodyText1:
          //     GoogleFonts.openSans(color: BookGanga.kDarkBlack, fontSize: 14.0),
          bodyText1: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 14.0,
              color: BookGanga.kDarkBlack),
          // for blog view screen
          // bodyText2:
          //     GoogleFonts.openSans(color: BookGanga.kGrey, fontSize: 14.0),
          bodyText2: TextStyle(
              fontFamily: 'OpenSans', color: BookGanga.kGrey, fontSize: 14.0),
        ),
        accentColor: BookGanga.kAccentColor,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<DiscoverbooksCubit>(create: (_) => DiscoverbooksCubit()),
          //* add new cubits here to provide the thoughout the app
        ],
        child: NavScreen(),
      ),
    );
  }
}
