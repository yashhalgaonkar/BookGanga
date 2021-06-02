import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'chat_list_tab.dart';
import 'club_list_tab.dart';

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
      ),
      body: Column(
        children: [
          MyTabBar(
            tabController: _tabController,
            context: context,
            horizontalPadding: 65,
            tabs: [
              Tab(
                text: 'Clubs',
              ),
              Tab(
                text: 'Chats',
              ),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [ClubList(), ChatList()],
              controller: _tabController,
            ),
          ),
        ],
      ),
    );
  }
}
