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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: BookGanga.scaffold,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          color: Colors.black,
          onPressed: () => (user == currentUser)
              ? print('Back Pressed')
              : Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert_sharp),
            color: Colors.black,
            onPressed: () => print('More Options Pressed'),
          )
        ],
      ),
      body: SafeArea(
        child: DefaultTabController(
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
                      _BlogListWidget(
                        user: user,
                      ),
                      _ReviewsListWidget(),
                      //_BlogListWidget(),
                      _ShareListWidget(),
                    ],
                  ),
                )
              ],
            ),
          ),
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
      //color: Colors.red,
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatar(
            imageUrl: user.profileImageUrl,
            radius: 50.0,
          ),
          const SizedBox(height: 10.0),
          //* Full Display name of the user
          Text(
            '${user.fname} ${user.lname}',
            style:
                Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20.0),
          ),
          //const SizedBox(height: 10.0)
          //* bio
          Text(
            'The greatest thing I do is I write awesome articles',
            //user.bio,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 10.0),

          _StatsCorner(),

          const SizedBox(height: 10.0),

          _FollowAndMessageButton(),
        ],
      ),
    );
  }
}

/// This widget tells that stats of the user
/// Number of follwers, number of books in bookshelf and wish list
class _StatsCorner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatsWidgetTile(
              label: 'Followers',
              count: '986',
              onClick: () => print('Followers Clicked')),
          _StatsWidgetTile(
              label: 'Book Shelf',
              count: '78',
              onClick: () => print('BookShelf Clicked')),
          _StatsWidgetTile(
              label: 'Wish List',
              count: '17',
              onClick: () => print('WishList Clicked')),
        ],
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
              '7',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 10.0),
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
          Expanded(
              child: MyTextButton(
            label: 'Follow',
            onClick: () {
              print('Follow Clicked');
            },
          )),
          const SizedBox(width: 10.0),
          Expanded(
              child: MyTextButton(
            label: 'Message',
            onClick: () {
              print('MEssage Clicked');
            },
          )),
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
        //color: Colors.green,
        //padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(count, style: Theme.of(context).textTheme.bodyText1),
            ),
            Text(
              label,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
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
      //color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text('No Shares'),
    );
  }
}

class _ReviewsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      //color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text('No Reviews'),
    );
  }
}

class _BlogListWidget extends StatelessWidget {
  final User user;
  _BlogListWidget({
    this.user,
  });
  @override
  Widget build(BuildContext context) {
    
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) => (index == 0)
            ? BlogContainer(blog: blogs[index], paddingTop: true)
            : BlogContainer(blog: blogs[index]),
        itemCount: blogs.length,
      ),
    );
  }
}
