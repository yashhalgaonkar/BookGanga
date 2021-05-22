import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/cubit/user_profile_screen_cubit.dart';
import 'package:book_ganga/ui/widgets/post_container.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

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
              return _buildLoadingWidget();
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
            '${user.fname} ${user.lname}',
            //'Aditya Giradkar',
            // style: Theme.of(context)
            //     .textTheme
            //     .bodyText1
            //     .copyWith(fontWeight: FontWeight.w600),
            style: GoogleFonts.sacramento(
              fontWeight: FontWeight.w700,
              fontSize: 32.0,
              color: BookGanga.kDarkBlack,
            ),
          ),

          Text('@${user.username}',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 5.0),
          //* bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              user.bio,
              //user.bio,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12.0,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),

          _StatsCorner(
            user: user,
          ),

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
      margin: const EdgeInsets.symmetric(vertical: 10.0),
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

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      //padding: const EdgeInsets.only(horizontal: 10.0),
      //padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0.0),
      child: TabBar(
          labelPadding: EdgeInsets.all(0),
          indicatorPadding: EdgeInsets.all(0),
          isScrollable: false,
          labelColor: kBlackColor,
          unselectedLabelColor: kGreyColor,
          labelStyle:
              GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600),
          indicator: MaterialIndicator(
            color: BookGanga.kAccentColor,
            tabPosition: TabPosition.bottom,
            horizontalPadding: 50,
            paintingStyle: PaintingStyle.fill,
          ),
          // indicator: DotIndicator(
          //   color: BookGanga.kAccentColor,
          //   radius: 3,
          //   distanceFromCenter: 16,
          //   paintingStyle: PaintingStyle.fill,
          // ),
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
