import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';

class LabelWidget extends StatelessWidget {
  final String label;
  final String sublabel;
  final Function onClick;
  final bool centerLabel;

  const LabelWidget({
    Key key,
    this.label,
    this.sublabel = "",
    this.onClick,
    this.centerLabel,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 6.0),
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18.0),
            ),
            InkWell(
              onTap: onClick,
              child: Text(
                sublabel,
                style:
                    Theme.of(context).textTheme.bodyText1.copyWith(color: BookGanga.kAccentColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
