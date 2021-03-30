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

class _UserProfileScreenState extends State<UserProfileScreen> with SingleTickerProviderStateMixin {
  User get user => widget.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.0,
        centerTitle: true,
        title: Text(
          '${user.fname}\'s Profile',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20.0),
        ),
        backgroundColor: BookGanga.scaffold,
      ),
      body: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverToBoxAdapter(child: _ProfileHeader(user: user)),
            ];
          },
          body: Column(
            children: [
              //const SizedBox(height: 6.0),
              _TabBarContainer(),
              Expanded(
                child: TabBarView(
                  children: [
                    _BlogListWidget(),
                    _ReviewsListWidget(),
                    _BlogListWidget(),
                    //_ShareListWidget(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

///widget for the tabs - Blog, Reviews, Shares
class _TabBarContainer extends StatelessWidget {
  const _TabBarContainer({Key key}) : super(key: key);

  Widget _getTab(String label, BuildContext context) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 10.0),
          CircleAvatar(
            radius: 10.0,
            backgroundColor: BookGanga.kGrey,
            child: Text(
              '27',
              style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 10.0),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.symmetric(horizontal: 10.0),
      padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0.0),
      child: Column(
        children: [
          TabBar(
            isScrollable: false,
            indicatorColor: BookGanga.kAccentColor,
            tabs: [
              _getTab('Blogs', context),
              _getTab('Reviews', context),
              _getTab('Shares', context),
            ],
            onTap: (index) => print('Index $index tapped'),
          ),
        ],
      ),
    );
  }
}

/// Follow and message button on the profile
class _FollowAndMessageButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      child: Row(
        children: [
          // Expanded(
          //   child: OutlineButton(
          //     onPressed: () => print('Book Shelf Clicked'),
          //     child: Text(
          //       'Book Shelf',
          //       style: Theme.of(context).textTheme.bodyText1,
          //     ),
          //     //highlightColor: BookGanga.kNiceAccentColor,
          //     borderSide: BorderSide.none,
          //     //splashColor: BookGanga.kNiceAccentColor,
          //   ),
          // ),
          // Expanded(
          //   child: OutlineButton(
          //     onPressed: () => print('Read List clicked'),
          //     child: Text(
          //       'Read List',
          //       style: Theme.of(context).textTheme.bodyText1,
          //     ),
          //     //highlightColor: BookGanga.kNiceAccentColor,
          //     borderSide: BorderSide.none,
          //     //splashColor: BookGanga.kNiceAccentColor,
          //   ),
          // ),

          Expanded(
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                alignment: Alignment.center,
                backgroundColor: MaterialStateProperty.all(BookGanga.kAccentColor),
              ),
              onPressed: () {
                print('Follow clicked');
              },
              child: Text('Follow',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(EdgeInsets.zero),
                backgroundColor: MaterialStateProperty.all(BookGanga.kAccentColor),
              ),
              onPressed: () {
                print('Message clicked');
              },
              child: Text('Message',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Individual Tile in the stats
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
    return InkWell(
      onTap: onClick,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(
                count,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
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

/// The main header of the profile screen
/// with Profile image, Name, bio, stats
/// and follow and like button
class _ProfileHeader extends StatelessWidget {
  final User user;

  _ProfileHeader({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              //*profile image
              ProfileAvatar(
                imageUrl: user.profileImageUrl,
                radius: 40.0,
                hasBorder: false,
              ),

              const SizedBox(width: 10.0),

              //*Stats
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _StatsWidgetTile(
                      label: 'Followers',
                      count: '125',
                      onClick: () {},
                    ),
                    _StatsWidgetTile(
                      label: 'Book Shelf',
                      count: '27',
                      onClick: () {},
                    ),
                    _StatsWidgetTile(
                      label: 'Wish List',
                      count: '7',
                      onClick: () {},
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(height: 8.0),

          //* Usser name
          Text(
            '${user.fname} ${user.lname}',
            style: Theme.of(context).textTheme.bodyText1,
          ),

          //* bio
          Text(
            user.bio,
            style: Theme.of(context).textTheme.bodyText2,
            textAlign: TextAlign.left,
            maxLines: 2,
          ),

          const SizedBox(height: 6.0),

          _FollowAndMessageButton(),
        ],
      ),
    );
  }
}

/// TAB layout views to be displayed inside each tab
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
      child: ListView.builder(
        itemBuilder: (context, index) => (index == 0)
            ? BlogContainer(blog: blogs[index], paddingTop: true)
            : BlogContainer(blog: blogs[index]),
        itemCount: 10,
      ),
    );
  }
}
