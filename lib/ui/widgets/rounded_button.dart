import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            MaterialStateProperty.all(BookGanga.kAccentColor),
      ),
      onPressed: () {
        print('Follow clicked');
      },
      child: Text(
        'Follow',
        style: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(color: Colors.white),
      ),
    );
  }
}