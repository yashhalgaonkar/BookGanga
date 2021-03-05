import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserProfileScreen extends StatefulWidget {
  final User user;

  UserProfileScreen({
    @required this.user,
  });
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  User get user => widget.user;

  Widget _getTab(String label) {
    return Tab(
      child: Text(
        label,
        style: const TextStyle(
          color: BookGanga.kDarkBlack,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.keyboard_backspace,
              color: BookGanga.kDarkBlack,
            ),
            onPressed: () {
              print('back pressed');
            }),
        actions: [
          IconButton(
              icon: Icon(
                Icons.more_vert,
                color: BookGanga.kDarkBlack,
              ),
              onPressed: () {
                print('More button pressed');
              })
        ],
        centerTitle: true,
        title: Text(
          '${user.fname}\'s Profile',
          style: BookGanga.kAppBarTitleStyle.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 22.0,
          ),
        ),
        backgroundColor: BookGanga.scaffold,
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverList(
                delegate: SliverChildBuilderDelegate((_, index) {
                  return _ProfileHeader(user: user);
                }, childCount: 1),
              )
            ];
          },
          body: Column(
            children: [
              _TabBarContainer(),
              Expanded(
                  child: TabBarView(
                children: [
                  _BlogListWidget(),
                  _ReviewsListWidget(),
                  _ShareListWidget(),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}

class _UserAppBar extends StatelessWidget {
  const _UserAppBar({
    Key key,
    @required this.user,
  }) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
          icon: Icon(
            Icons.keyboard_backspace,
            color: BookGanga.kDarkBlack,
          ),
          onPressed: () {
            print('back pressed');
          }),
      actions: [
        IconButton(
            icon: Icon(
              Icons.more_vert,
              color: BookGanga.kDarkBlack,
            ),
            onPressed: () {
              print('More button pressed');
            })
      ],
      centerTitle: true,
      title: Text(
        '${user.fname}\'s Profile',
        style: BookGanga.kAppBarTitleStyle.copyWith(
          fontWeight: FontWeight.bold,
          fontSize: 22.0,
        ),
      ),
      backgroundColor: BookGanga.scaffold,
    );
  }
}

class _TabBarContainer extends StatelessWidget {
  const _TabBarContainer({Key key}) : super(key: key);

  Widget _getTab(String label) {
    return Tab(
      child: Text(
        label,
        style: const TextStyle(
          color: BookGanga.kDarkBlack,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
        child: Column(
          children: [
            TabBar(
              isScrollable: false,
              indicatorColor: BookGanga.kNiceAccentColor,
              tabs: [
                _getTab('Blogs'),
                _getTab('Reviews'),
                _getTab('Share'),
              ],
              onTap: (index) => print('Index $index tapped'),
            ),
            // Container(
            //   color: Colors.amber,
            //   child: TabBarView(
            //     controller: tabController,
            //     children: [
            //       _BlogListWidget(),
            //       _ReviewsListWidget(),
            //       _ShareListWidget(),
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class _ShareListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.greenAccent,
      alignment: Alignment.center,
      child: Text('share list'),
    );
  }
}

class _ReviewsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text('REview List  Wdiget'),
    );
  }
}

class _BlogListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      color: Colors.amberAccent,
      alignment: Alignment.center,
      child: ListView.builder(
        itemBuilder: (context, index) => Text('Blog List  Wdiget'),
        itemCount: 100,
      ),
    );
  }
}

class _BooksButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.green.shade100,
      height: 35.0,
      //margin: const EdgeInsets.symmetric(vertical: 3.0),
      //padding: const EdgeInsets.all(6.0),
      child: Row(
        children: [
          Expanded(
            child: OutlineButton(
              onPressed: () => print('Book Shelf Clicked'),
              child: Text(
                'Book Shelf',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              //highlightColor: BookGanga.kNiceAccentColor,
              borderSide: BorderSide.none,
              //splashColor: BookGanga.kNiceAccentColor,
            ),
          ),
          Container(
            child: const VerticalDivider(
              width: 4.0,
              color: Colors.black26,
            ),
            width: 10.0,
          ),
          Expanded(
            child: OutlineButton(
              onPressed: () => print('Read List clicked'),
              child: Text(
                'Read List',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
              //highlightColor: BookGanga.kNiceAccentColor,
              borderSide: BorderSide.none,
              //splashColor: BookGanga.kNiceAccentColor,
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsWidget extends StatelessWidget {
  final User user;

  _StatsWidget({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //padding: const EdgeInsets.all(6.0),
      margin: const EdgeInsets.symmetric(vertical: 6.0),
      height: 40.0,
      child: Row(
        children: [
          _StatsWidgetTile(
            label: 'Followers',
            count: '${user.numFollowers}',
            onClick: () {},
          ),
          const VerticalDivider(
            width: 4.0,
            color: Colors.black26,
          ),
          _StatsWidgetTile(
            label: 'Following',
            count: '${user.numFollowing}',
            onClick: () {},
          ),
          const VerticalDivider(
            width: 4.0,
            color: Colors.black26,
          ),
          _StatsWidgetTile(
            label: 'Blogs',
            count: '${user.numBlogs}',
            onClick: () {
              print('num blogs clicked');
            },
          ),
          const VerticalDivider(
            width: 4.0,
            color: Colors.black26,
          ),
          _StatsWidgetTile(
            label: 'Reviews',
            count: '${user.numReviews}',
            onClick: () {},
          ),
        ],
      ),
    );
  }
}

class _StatsWidgetTile extends StatelessWidget {
  final String label;
  final String count;
  final Function onClick;

  const _StatsWidgetTile({
    Key key,
    @required this.label,
    @required this.count,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onClick,
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Material(
                  child: Text(
                    count,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            Text(label),
          ],
        ),
      ),
    );
  }
}

class _ProfileHeader extends StatelessWidget {
  final User user;

  _ProfileHeader({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileAvatar(
              imageUrl: user.profileImageUrl,
              radius: 45.0,
              hasBorder: false,
            ),
            const SizedBox(height: 5.0),
            Text(
              '${user.fname} ${user.lname}',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              user.bio,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
            const Divider(
              height: 6.0,
            ),
            _StatsWidget(user: user),
            const Divider(height: 6.0),
            _BooksButton(),
          ],
        ),
      ),
    );
  }
}
