import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/cubit/user_profile_screen_cubit.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserProfileScreen extends StatefulWidget {
  final UserToDisplay user;

  UserProfileScreen({
    @required this.user,
  });
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  //UserToDisplay get user => widget.user;

  UserProfileScreenCubit _userProfileScreenCubit;
  @override
  void initState() {
    super.initState();
    _userProfileScreenCubit = BlocProvider.of<UserProfileScreenCubit>(context);
    _userProfileScreenCubit.getUser('dummy_user_id');
  }

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
          onPressed: () {
            print('Back pressed');
          },
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
        child: BlocConsumer<UserProfileScreenCubit, UserProfileScreenState>(
          listener: (_, state) {
            if (state is UserProfileScreenError)
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('Error'),
                action: SnackBarAction(
                  label: 'Retry',
                  onPressed: () =>
                      _userProfileScreenCubit.getUser('dummy_user_id'),
                ),
              ));
          },
          // ignore: missing_return
          builder: (_, state) {
            if (state is UserProfileScreenLoading ||
                state is UserProfileScreenInitial)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (state is UserProfileScreenLoaded)
              return DefaultTabController(
                length: 3,
                child: NestedScrollView(
                  headerSliverBuilder: (context, _) {
                    return [
                      SliverToBoxAdapter(
                          child: _ProfileHeader(user: state.user)),
                    ];
                  },
                  body: Column(
                    children: [
                      //const SizedBox(height: 6.0),
                      _TabBarContainer(user: state.user),
                      Expanded(
                        child: TabBarView(
                          children: [
                            _BlogListWidget(),
                            _ReviewsListWidget(),
                            //_BlogListWidget(),
                            _ShareListWidget(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            else if (state is UserProfileScreenError)
              return Center(
                child: Text(state.errorMessage),
              );
          },
        ),
      ),
    );
  }
}

/// The main header of the profile screen
/// with Profile image, Name, bio, stats
/// and follow and like button
class _ProfileHeader extends StatelessWidget {
  final UserToDisplay user;

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
            user.bio,
            //user.bio,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
            maxLines: 2,
          ),
          const SizedBox(height: 10.0),

          _StatsCorner(
            user: user,
          ),

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
  final UserToDisplay user;

  _StatsCorner({@required this.user});
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
              count: '${user.numFollowers}',
              onClick: () => print('Followers Clicked')),
          _StatsWidgetTile(
              label: 'Book Shelf',
              count: '${user.numBookShelf}',
              onClick: () => print('BookShelf Clicked')),
          _StatsWidgetTile(
              label: 'Wish List',
              count: '${user.numWishList}',
              onClick: () => print('WishList Clicked')),
        ],
      ),
    );
  }
}

///widget for the tabs - Blog, Reviews, Shares
class _TabBarContainer extends StatelessWidget {
  final UserToDisplay user;
  const _TabBarContainer({Key key, @required this.user}) : super(key: key);

  Widget _getTab(String label, BuildContext context, int count) {
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
              '$count',
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
              _getTab('Blogs', context, user.numBlogs),
              _getTab('Reviews', context, user.numReviews),
              _getTab('Shares', context, user.numShares),
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
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
