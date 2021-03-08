import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        actions: [
          Container(
            width: 85.0,
            margin: const EdgeInsets.all(10.0),
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(BookGanga.kAccentColor),
              ),
              onPressed: () {
                print('Follow clicked');
              },
              child: Text(
                'Follow',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          IconButton(
            icon: Icon(
              MdiIcons.messageOutline,
              color: BookGanga.kDarkBlack,
            ),
            onPressed: () {
              print('More button pressed');
            },
          )
        ],
        centerTitle: false,
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
                    _ShareListWidget(),
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

class _TabBarContainer extends StatelessWidget {
  const _TabBarContainer({Key key}) : super(key: key);

  Widget _getTab(String label, BuildContext context) {
    return Tab(
      child: Text(
        label,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 6.0),
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
      ),
    );
  }
}

class _BooksButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40.0,
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
                backgroundColor:
                    MaterialStateProperty.all(BookGanga.kAccentColor),
              ),
              onPressed: () {
                print('Book Shelf clicked');
              },
              child: Text('Book Shelf',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white)),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextButton(
              style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all(BookGanga.kAccentColor),
              ),
              onPressed: () {
                print('Read Shelf clicked');
              },
              child: Text('Read List',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(color: Colors.white)),
            ),
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

class _ProfileHeader extends StatelessWidget {
  final User user;

  _ProfileHeader({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 6.0),
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
                        label: 'BLogs',
                        count: '27',
                        onClick: () {},
                      ),
                      _StatsWidgetTile(
                        label: 'Reviews',
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
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: BookGanga.kDarkBlack,
              ),
            ),

            //* bio
            Text(
              user.bio,
              style: TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
                color: BookGanga.kDarkBlack,
              ),
              textAlign: TextAlign.left,
              maxLines: 2,
            ),

            const SizedBox(height: 6.0),

            _BooksButton(),
          ],
        ),
      ),
    );
  }
}

//* The list that are to be displayed in tab view
//* Shares Tab
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

//* Reviews Tab
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

//* Blogs Tab
class _BlogListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => BlogContainer(blog: blogs[index]),
        itemCount: 10,
      ),
    );
  }
}
