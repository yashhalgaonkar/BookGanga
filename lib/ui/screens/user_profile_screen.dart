import 'package:book_ganga/config/book_ganga.dart';
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

class _UserProfileScreenState extends State<UserProfileScreen> {
  User get user => widget.user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
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
            SliverToBoxAdapter(
              child: _ProfileHeader(user: user),
            ),
            SliverToBoxAdapter(
              child: _StatsWidget(user: user),
            ),
            SliverToBoxAdapter(
              child: _BooksButton(),
            ),

            
          ],
        ),
      ),
    );
  }
}

class _BooksButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        //color: Colors.green.shade100,
        height: 50.0,
        padding: const EdgeInsets.all(6.0),
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
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 10.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        height: 60.0,
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
              onClick: () {},
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
                fontSize: 20.0,
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
            )
          ],
        ),
      ),
    );
  }
}
