import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/services/user_service.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/pages/user_detail_screen.dart';
import 'package:get_it/get_it.dart';
import '../widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import '../widgets/tab_view_widgets.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;

  UserProfileScreen({
    @required this.username,
  });
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  //UserToDisplay get user => widget.user;

  void getUser() {
    _future = _userService.getUser(widget.username);
  }

  @override
  void initState() {
    super.initState();
    getUser();
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

  Future<UserToDisplay> _future;
  final UserService _userService = GetIt.I<UserService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert, color: BookGanga.kDarkBlack),
            onPressed: () => print('More options pressed'),
          ),
        ],
      ),
      body: FutureBuilder<UserToDisplay>(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot<UserToDisplay> user) {
            if (user.connectionState == ConnectionState.done) {
              if (user.hasError)
                return MyErrorWidget(onRefresh: getUser);
              else
                //* Loaded widget
                return DefaultTabController(
                  length: 3,
                  child: NestedScrollView(
                    headerSliverBuilder: (context, _) {
                      return [
                        SliverToBoxAdapter(
                          child: UserProfileHeader(
                            user: user.data,
                            isFollowing: user.data.isFollowing,
                            onFollowTap: () {
                              setState(() {
                                user.data.isFollowing = !user.data.isFollowing;
                              });
                            },
                            onMessageTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UserDetailScreen()));
                            },
                            onBookShelfTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UserDetailScreen()));
                            },
                            onWishListTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UserDetailScreen()));
                            },
                            onFollowersTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => UserDetailScreen()));
                            },
                          ),
                        ),
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
                              BlogListWidget(),
                              ReviewsListWidget(),
                              ShareListWidget(),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
            } else
              //* Loading Widget
              return _buildLoadingWidget();
          }),
    );
  }
}
