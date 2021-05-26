import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:line_icons/line_icons.dart';

class MyInputField extends StatelessWidget {
  final String hintText;
  const MyInputField({
    Key key,
    this.hintText = 'Search Books...',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BookGanga.kLightGreyColor),
      child: Stack(
        children: <Widget>[
          TextField(
            autofocus: false,
            cursorColor: BookGanga.kAccentColor,
            enabled: true,
            enableSuggestions: true,
            keyboardType: TextInputType.text,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, bottom: 5),
              border: InputBorder.none,
              hintText: hintText,
              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: BookGanga.kGrey,
                  ),
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BookGanga.kAccentColor.withOpacity(0.8),
                ),
                child: Icon(LineIcons.search, color: Colors.white),
                alignment: Alignment.center,
              )),
        ],
      ),
    );
  }
}
