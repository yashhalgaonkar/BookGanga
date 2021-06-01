import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/cubit/user_profile_screen_cubit.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

class UserProfileScreen extends StatefulWidget {
  final UserToDisplay user;
  final bool isFollowing;

  UserProfileScreen({
    @required this.user,
    this.isFollowing = true,
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

  Widget _buildLoadingWidget() {
    return Center(
      //child: CircularProgressIndicator(),
      child: Loading(
          indicator: BallPulseIndicator(),
          size: 30.0,
          color: BookGanga.kAccentColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 40.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: BookGanga.scaffold,
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
              return _buildLoadingWidget();
            else if (state is UserProfileScreenLoaded)
              return DefaultTabController(
                length: 3,
                child: NestedScrollView(
                  headerSliverBuilder: (context, _) {
                    return [
                      SliverToBoxAdapter(
                          child: _ProfileHeader(
                              user: state.user,
                              isFollowing: widget.isFollowing)),
                    ];
                  },
                  body: Column(
                    children: [
                      //const SizedBox(height: 6.0),
                      //_TabBarContainer(user: state.user,tabController: DefaultTabController.of(context)),
                      MyTabBar(
                          tabController: DefaultTabController.of(context),
                          context: context,
                          tabs: [
                            Tab(
                              text: 'Blogs',
                            ),
                            Tab(
                              text: 'Reviews',
                            ),
                            Tab(
                              text: 'Shares',
                            ),
                          ]),
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
              return MyErrorWidget(
                  onRefresh: () =>
                      _userProfileScreenCubit.getUser('dummy_user_id'),
                  errorMessage: state.errorMessage);
          },
        ),
      ),
    );
  }
}

/// The main header of the profile screen
/// with Profile image, Name, bio, stats
/// and follow and like button
class _ProfileHeader extends StatefulWidget {
  final UserToDisplay user;
  final bool isFollowing;

  _ProfileHeader({
    @required this.user,
    @required this.isFollowing,
  });

  @override
  __ProfileHeaderState createState() => __ProfileHeaderState();
}

class __ProfileHeaderState extends State<_ProfileHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatar(
            //imageUrl: user.profileImageUrl,
            imageUrl:
                'https://media-exp1.licdn.com/dms/image/C4E03AQEpsk7Ff1GdFw/profile-displayphoto-shrink_800_800/0/1593516152439?e=1626912000&v=beta&t=Pwv1wZKgtxnEZge1GBucHNJXDexO6JkyZiqvVDHsa40',
            radius: 45.0,
          ),
          const SizedBox(height: 5.0),
          //* Full Display name of the user
          Text(
            '${widget.user.fname} ${widget.user.lname}',
            //'Aditya Giradkar',
            // style: Theme.of(context)
            //     .textTheme
            //     .bodyText1
            //     .copyWith(fontWeight: FontWeight.w600),
            style: BookGanga.titleStyle,
          ),

          Text('@${widget.user.username}',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 5.0),
          //* bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.user.bio,
              //user.bio,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12.0,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),

          _StatsRow(user: widget.user),

          _FollowAndMessageButton(isFollowing: widget.isFollowing),
        ],
      ),
    );
  }
}

/// This widget tells that stats of the user
/// Number of follwers, number of books in bookshelf and wish list
class _StatsRow extends StatelessWidget {
  final UserToDisplay user;

  _StatsRow({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: const EdgeInsets.symmetric(vertical: 15.0),
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

/// Follow and message button on the profile
class _FollowAndMessageButton extends StatefulWidget {
  bool isFollowing;

  _FollowAndMessageButton({@required this.isFollowing});

  @override
  __FollowAndMessageButtonState createState() =>
      __FollowAndMessageButtonState();
}

class __FollowAndMessageButtonState extends State<_FollowAndMessageButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: widget.isFollowing
                          ? BookGanga.kBlack
                          : Colors.transparent,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(6)),
              child: TextButton(
                child: Text(widget.isFollowing ? 'Following' : 'Follow'),
                onPressed: () {
                  setState(() {
                    widget.isFollowing = !widget.isFollowing;
                  });
                },
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(widget.isFollowing
                      ? Colors.white
                      : BookGanga.kAccentColor),
                  foregroundColor: MaterialStateProperty.all(
                      widget.isFollowing ? BookGanga.kDarkBlack : Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextButton(
              child: Text('Message'),
              onPressed: () {
                print('Message Pressed');
              },
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor:
                    MaterialStateProperty.all(BookGanga.kAccentColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed))
                      return BookGanga.kAccentColor.withOpacity(0.5);
                    return BookGanga.kAccentColor;
                  },
                ),
              ),
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
        height: 35.0,
        //color: Colors.green,
        //padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(count,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12.0)),
            ),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 12.0),
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
  final BlogToDisplay blog = BlogToDisplay(
      authorImageUrl: '',
      authorName: 'Yash Halgaonkar',
      title: 'Happyness or Happiness',
      blogHeaderImageUrl:
          'https://images.unsplash.com/photo-1604346782646-13dac014c258?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (_, index) {
          return PostContainer(blog: blog);
        },
        itemCount: 25,
      ),
    );
  }
}
