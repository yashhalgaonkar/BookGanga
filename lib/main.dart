import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';
import 'ui/screens/screens.dart';

void main() => runApp(MyApp());

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
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: BookGanga.scaffold,
        textTheme: TextTheme(
          bodyText1: const TextStyle(
            color: BookGanga.kDarkBlack,
            fontWeight: FontWeight.bold,
          ),
          bodyText2: const TextStyle(
            fontWeight: FontWeight.w500,
            color: BookGanga.kDarkBlack,
          ),
          button: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        iconTheme: IconThemeData(color: BookGanga.kDarkBlack, size: 25.0),
        accentColor: BookGanga.kAccentColor,
        brightness: Brightness.light,
        bottomAppBarColor: Colors.white,
      ),
      // home: AnimatedSplashScreen(
      //   splash: Container(
      //     height: double.maxFinite,
      //     width: double.maxFinite,
      //     child: Center(
      //       child: Row(
      //         children: [Icon(Icons.format_quote_sharp), Text('BookGanga')],
      //       ),
      //     ),
      //   ),
      //   nextScreen: NavScreen(),
      //   splashTransition: SplashTransition.fadeTransition,
      //   //pageTransitionType: PageTransitionType.scale,
      // ),

      home: NavScreen(),
    );
  }
}

/*
class RecommendationTile extends StatelessWidget {
  final Function onTap;

  const RecommendationTile({
    Key key,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Text(
              'Tune your recommendations',
              style: TextStyle(color: Colors.teal, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 15.0,
            ),
            Expanded(
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6.0)),
                      border: Border.all(color: Colors.black, width: 1.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'Done for Today',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w400),
                        ),
                        Icon(
                          Icons.check_circle_outline,
                          size: 20.0,
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
*/
