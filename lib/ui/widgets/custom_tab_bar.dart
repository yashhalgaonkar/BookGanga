import 'package:flutter/material.dart';
import '../../config/book_ganga.dart';

class CustomTabBar extends StatelessWidget {
  final List<IconData> icons;
  final int selectedIndex;
  final Function(int) onTap;
  final bool isBottomIndicator;

  const CustomTabBar({
    Key key,
    @required this.icons,
    @required this.selectedIndex,
    @required this.onTap,
    this.isBottomIndicator = true,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TabBar(
      onTap: onTap,
      indicatorPadding: EdgeInsets.zero,
      indicator: BoxDecoration(
          border: Border(
        top: BorderSide(
          color: BookGanga.kAccentColor,
          width: 3.0,
        ),
      )),
      tabs: icons
          .asMap()
          .map((i, e) => MapEntry(
              i,
              Tab(
                icon: Icon(
                  e,
                  color: selectedIndex == i
                      ? BookGanga.kAccentColor
                      : BookGanga.kBlack,
                  size: 25.0,
                ),
              )))
          .values
          .toList(),
    );
  }
}
