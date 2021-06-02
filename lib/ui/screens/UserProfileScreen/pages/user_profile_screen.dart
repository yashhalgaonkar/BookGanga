import 'package:book_ganga/ui/screens/UserProfileScreen/pages/user_detail_screen.dart';

import '../widgets/profile_header.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/cubit/user_profile_screen_cubit.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import '../widgets/tab_view_widgets.dart';

class UserProfileScreen extends StatefulWidget {
  final String username;

  UserProfileScreen({this.username});
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen>
    with SingleTickerProviderStateMixin {
  //UserToDisplay get user => widget.user;

  String get username => widget.username;

  UserProfileScreenCubit _userProfileScreenCubit;
  @override
  void initState() {
    super.initState();
    _userProfileScreenCubit = BlocProvider.of<UserProfileScreenCubit>(context);
    _userProfileScreenCubit.getUser(username);
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
    return BlocProvider(create: (_)=> UserProfileScreenCubit(),
      child: Scaffold(
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
                          child: UserProfileHeader(
                            user: state.user,
                            isFollowing: state.user.isFollowing,
                            onFollowTap: () {
                              setState(() {
                                state.user.isFollowing = !state.user.isFollowing;
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
              else if (state is UserProfileScreenError)
                return MyErrorWidget(
                    onRefresh: () =>
                        _userProfileScreenCubit.getUser('dummy_user_id'),
                    errorMessage: state.errorMessage);
            },
          ),
        ),
      ),
    );
  }
}
