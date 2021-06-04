import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:book_ganga/viewmodels/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'bookshelf_tab.dart';
import 'follower_tab.dart';
import 'wish_list_tab.dart';

class UserDetailScreen extends StatefulWidget {
  final int tabIndex;

  const UserDetailScreen({Key key, @required this.tabIndex}) : super(key: key);

  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: BookGanga.kDarkBlack),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text('Yash\'s Books',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      body: DefaultTabController(
        length: 3,
        initialIndex: widget.tabIndex,
        child: Column(
          children: [
            MyTabBar(
              tabController: DefaultTabController.of(context),
              context: context,
              tabs: [
                Tab(text: 'Followers'),
                Tab(text: 'BookShelf'),
                Tab(text: 'Wish List'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: DefaultTabController.of(context),
                children: [
                  FollowerList(),
                  BookShelfList(),
                  WishListList(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
