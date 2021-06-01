import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class BookClubList extends StatefulWidget {
  @override
  _BookClubListState createState() => _BookClubListState();
}

class _BookClubListState extends State<BookClubList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: BookGanga.kDarkBlack),
            onPressed: () => Navigator.pop(context),
          ),
          backgroundColor: Colors.white,
          title: Text(
            'Book Clubs',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          bottom: TabBar(
              controller: _tabController,
              labelPadding: EdgeInsets.all(0),
              indicatorPadding: EdgeInsets.all(0),
              isScrollable: false,
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
                horizontalPadding: 65,
                paintingStyle: PaintingStyle.fill,
              ),
              // indicator: DotIndicator(
              //   color: BookGanga.kAccentColor,
              //   radius: 3,
              //   distanceFromCenter: 16,
              //   paintingStyle: PaintingStyle.fill,
              // ),
              tabs: [Tab(text: 'Clubs'), Tab(text: 'Chats')])),
      body: TabBarView(
        controller: _tabController,
        children: [
          _ClubList(),
          _ChatList(),
        ],
      ),
    );
  }
}

class _ClubList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
