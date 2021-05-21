import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:book_ganga/ui/widgets/post_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Ganga',
          style: GoogleFonts.sacramento(
            fontSize: 32.0,
            color: BookGanga.kDarkBlack,
            fontWeight: FontWeight.w900,
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
          child: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          //* Greeting widget
          // _GreetingWidget(),

          //* saved articles widget
          // _ReadSavedBlogsWidget(),

          //* List of blogs feeds
          Expanded(
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
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          final BlogToDisplay blog = state.blogs[index];
                          //return BlogContainer(blog: blog, paddingTop: false);
                          return PostContainer(blog: blog);
                        },
                        //separatorBuilder: (_, index) {},
                        itemCount: state.blogs.length);
                  else if (state is HomeScreenLoading)
                    return Center(
                      //child: CircularProgressIndicator(),
                      child: Loading(
                          indicator: BallPulseIndicator(),
                          size: 30.0,
                          color: BookGanga.kAccentColor),
                    );
                  else
                    return Center(
                        child: Column(
                      children: [
                        IconButton(
                          icon: Icon(
                            Ionicons.reload,
                          ),
                          onPressed: () {
                            _homeScreenCubit
                                .getHomeScreenBlogs('dummy_user_id');
                          },
                        ),
                        Text('Error Occured.'),
                      ],
                    ));
                },
              ),
            ),
          ),
        ],
      )),
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
              style: GoogleFonts.openSans(
                  fontSize: 14, color: BookGanga.kDarkBlack),
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

class _GreetingWidget extends StatelessWidget {
  const _GreetingWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Hi, Yash',
              style: GoogleFonts.openSans(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
            ),
            Text(
              'Good Morning!',
              style: GoogleFonts.openSans(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                  color: BookGanga.kDarkBlack),
            ),
          ],
        ));
  }
}
