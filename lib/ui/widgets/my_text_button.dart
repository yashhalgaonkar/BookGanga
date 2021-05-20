import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String label;
  final Function onClick;

  MyTextButton({@required this.label, @required this.onClick});
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2.0),
        padding: MaterialStateProperty.all(EdgeInsets.zero),
        alignment: Alignment.center,
        backgroundColor: MaterialStateProperty.all(BookGanga.kAccentColor),
      ),
      onPressed: onClick,
      child: Text('$label',
          style: Theme.of(context)
              .textTheme
              .bodyText1
              .copyWith(color: Colors.white, fontWeight: FontWeight.w600)),
    );
  }
}
