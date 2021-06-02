import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({
    Key key,
    @required TabController tabController,
    @required this.context,
    @required List<Tab> tabs,
    this.horizontalPadding = 45,
    this.isScrollable = false,
  })  : _tabController = tabController,
        _tabs = tabs,
        super(key: key);

  final TabController _tabController;
  final BuildContext context;
  final List<Tab> _tabs;
  final bool isScrollable;
  final double horizontalPadding;

  @override
  Widget build(BuildContext context) {
    return TabBar(
        controller: _tabController,
        labelPadding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.all(0),
        isScrollable: isScrollable,
        labelColor: kBlackColor,
        unselectedLabelColor: kGreyColor,
        // labelStyle:
        //     GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 14.0, fontWeight: FontWeight.w700),
        // unselectedLabelStyle:
        //     GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
        indicator: MaterialIndicator(
          color: BookGanga.kAccentColor,
          tabPosition: TabPosition.bottom,
          horizontalPadding: horizontalPadding,
          paintingStyle: PaintingStyle.fill,
        ),
        // indicator: DotIndicator(
        //   color: BookGanga.kAccentColor,
        //   radius: 3,
        //   distanceFromCenter: 16,
        //   paintingStyle: PaintingStyle.fill,
        // ),
        tabs: _tabs);
  }
}
