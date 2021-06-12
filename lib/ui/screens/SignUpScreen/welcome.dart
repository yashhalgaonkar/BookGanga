import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/nav_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text('Book Ganga',
                  style: BookGanga.titleStyle
                      .copyWith(fontSize: 40, fontWeight: FontWeight.w600)),
              const SizedBox(height: 10),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 50),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.transparent, width: 1.0),
                    borderRadius: BorderRadius.circular(6)),
                child: TextButton(
                  child: Text('Create an Account'),
                  onPressed: () => Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => NavScreen())),
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(0.0),
                    backgroundColor:
                        MaterialStateProperty.all(BookGanga.kAccentColor),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    overlayColor: MaterialStateProperty.all(Colors.transparent),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => NavScreen())),
                child: Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  margin: const EdgeInsets.symmetric(horizontal: 50),
                  child: Text(
                    'Log In',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
