import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/widgets/follow_message_buttons.dart';
import 'package:book_ganga/ui/widgets/my_tabbar.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class ClubProfileScreen extends StatefulWidget {
  const ClubProfileScreen({Key key}) : super(key: key);

  @override
  _ClubProfileScreenState createState() => _ClubProfileScreenState();
}

class _ClubProfileScreenState extends State<ClubProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        // title: Text(
        //   ,
        //   style: Theme.of(context).textTheme.bodyText1.copyWith(
        //         fontSize: 16,
        //         fontWeight: FontWeight.w600,
        //       ),
        // ),
        leading: IconButton(
          icon: Icon(
            LineIcons.arrowLeft,
            color: BookGanga.kDarkBlack,
          ),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverToBoxAdapter(
                child: ClubProfileHeader(),
              )
            ];
          },
          body: Column(
            children: [
              MyTabBar(
                horizontalPadding: 65,
                tabController: DefaultTabController.of(context),
                context: context,
                tabs: [
                  Tab(text: 'Books'),
                  Tab(text: 'Member'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [ClubBookTab(), ClubMemberTab()],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ClubMemberTab extends StatelessWidget {
  const ClubMemberTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class ClubBookTab extends StatelessWidget {
  const ClubBookTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.teal,
    );
  }
}

class ClubProfileHeader extends StatelessWidget {
  const ClubProfileHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: 'trf',
            child: ProfileAvatar(
              //imageUrl: user.profileImageUrl,
              imageUrl:
                  'https://www.vit.edu/images/Technical_chapter/trf-logo.jpg',
              radius: 45.0,
            ),
          ),
          const SizedBox(height: 10.0),
          //* Full Display name of the user
          Text(
            'TRF Book Club',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 15, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 10.0),
          //* bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              'Official book club of The Robotics Forum, VIT, Pune',
              //user.bio,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14.0,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),

          Container(
            height: 50,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                Container(
                  child: Column(
                    children: [
                      Text('80'),
                      Text('Books'),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  child: Column(
                    children: [
                      Text('80'),
                      Text('Members'),
                    ],
                  ),
                ),
                const Spacer(),
              ],
            ),
          )

          //StatsRow(user: user),
        ],
      ),
    );
  }
}
