import 'package:flutter/material.dart';

class MyTextButton extends StatelessWidget {
  final String label;
  final Function onClick;
  final Color buttonColor;
  final Color textColor;

  MyTextButton({
    @required this.label,
    @required this.onClick,
    @required this.buttonColor,
    @required this.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: TextButton(

        style: ButtonStyle(
          
          elevation: MaterialStateProperty.all(0.0),
          padding: MaterialStateProperty.all(EdgeInsets.zero),
          alignment: Alignment.center,
          backgroundColor: MaterialStateProperty.all(buttonColor),
        ),

        onPressed: onClick,
        child: Text('$label',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w600,
                )),
      ),
    );
  }
}
