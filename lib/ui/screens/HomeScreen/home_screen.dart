import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenCubit _homeScreenCubit;
  @override
  void initState() {
    super.initState();
    _homeScreenCubit = BlocProvider.of<HomeScreenCubit>(context);
    _homeScreenCubit.getHomeScreenBlogs('dummy_user_id');
  }

  @override
  void dispose() {
    super.dispose();
    
  }

  void _onRefreshTapped() {
    _homeScreenCubit.getHomeScreenBlogs('dummy_user_id');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Book Ganga',
        //   style: BookGanga.titleStyle,
        // ),
        title: DefaultTextStyle(
          style: BookGanga.titleStyle,
          child: AnimatedTextKit(
            repeatForever: false,
            animatedTexts: [
              TyperAnimatedText('BookGanga'),
            ],
            displayFullTextOnTap: true,
          ),
        ),
        centerTitle: true,
        leading: Icon(
          LineIcons.quoteRight,
          color: BookGanga.kDarkBlack,
          size: 24.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(LineIcons.search),
            onPressed: () {},
            color: BookGanga.kDarkBlack,
          ),
          IconButton(
            icon: Icon(LineIcons.userFriends),
            onPressed: () {},
            color: BookGanga.kDarkBlack,
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
            listener: (context, state) {
              if (state is HomeScreenError)
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Error Occured'),
                  action: SnackBarAction(
                    label: 'Retry',
                    onPressed: () {
                      _homeScreenCubit.getHomeScreenBlogs('dummy_user_id');
                    },
                  ),
                ));
            },
            builder: (context, state) {
              if (state is HomeScreenLoaded)
                return ListView.builder(
                    padding: const EdgeInsets.only(top: 10),
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (_, index) {
                      //return BlogContainer(blog: blog, paddingTop: false);
                      if (index % 5 == 0 && index != 0)
                        return FollowerSuggesstionWidget();
                      if (index < state.blogs.length) {
                        final BlogToDisplay blog = state.blogs[index];
                        return PostContainer(blog: blog);
                      }
                      return const SizedBox();
                    },
                    //separatorBuilder: (_, index) {},
                    itemCount: state.blogs.length + state.blogs.length ~/ 5);
              else if (state is HomeScreenLoading)
                return LoadingWidget();
              else
                return MyErrorWidget(
                  errorMessage: (state as HomeScreenError).errorMessage,
                  onRefresh: _onRefreshTapped,
                );
            },
          ),
        ),
      ),
    );
  }
}

class FollowerSuggesstionWidget extends StatelessWidget {
  const FollowerSuggesstionWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      height: 190,
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            width: 150,
            margin: const EdgeInsets.only(right: 10.0),
            padding: const EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              border: Border.all(color: BookGanga.kLightGreyColor),
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Column(
              children: [
                ProfileAvatar(
                    radius: 45,
                    imageUrl:
                        'https://media-exp1.licdn.com/dms/image/C4E03AQEpsk7Ff1GdFw/profile-displayphoto-shrink_800_800/0/1593516152439?e=1626912000&v=beta&t=Pwv1wZKgtxnEZge1GBucHNJXDexO6JkyZiqvVDHsa40'),
                const Spacer(),
                Text(
                  'Yash Halgaonkar',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontWeight: FontWeight.w600),
                ),
                Text(
                  '@yash.halgaonkar',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(fontSize: 12.0),
                ),
                const Spacer(),
                // Container(
                //   width: double.maxFinite,
                //   height: 30.0,
                //   child: MyTextButton(
                //       label: 'Follow', onClick: () => print('Follows')),
                // ),
              ],
            ),
          );
        },
        itemCount: 10,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}

class _ReadSavedBlogsWidget extends StatelessWidget {
  const _ReadSavedBlogsWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('Saved Articles here'),
                  ),
                )));
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(color: BookGanga.kLightGreyColor, width: 1),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 10.0),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            Text(
              'Read your saved blogs here',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Icon(
                  Ionicons.arrow_forward,
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}