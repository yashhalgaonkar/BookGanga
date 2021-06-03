import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/services/blog_service.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  final String username;

  const HomeScreen({Key key, this.username}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BlogService _blogService = GetIt.I<BlogService>();
  Future<List<BlogToDisplay>> _futureHome;

  String get username => widget.username;

  @override
  void initState() {
    super.initState();
    _refreshFuture();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _refreshFuture() {
    setState(() {
      _futureHome = _blogService.getHomeScreenBlogs(username);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text(
        //   'Book Ganga',
        //   style: BookGanga.titleStyle,
        // ),
        title: Text('Book Ganga', style: BookGanga.titleStyle),
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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => BookClubList()));
            },
            color: BookGanga.kDarkBlack,
          ),
        ],
      ),
      body: SafeArea(
        child: FutureBuilder<List<BlogToDisplay>>(
          future: _futureHome,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              //* Error Widget
              return MyErrorWidget(
                  errorMessage: snapshot.error.toString(),
                  onRefresh: _refreshFuture);
            }
            if (snapshot.hasData) {
              //* Loaded Widget
              final List<BlogToDisplay> blogs = snapshot.data;
              return ListView.builder(
                  padding: const EdgeInsets.only(top: 10),
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (_, index) {
                    final BlogToDisplay blog = blogs[index];
                    return PostContainer(blog: blog);
                  },
                  itemCount: blogs.length);
            } else {
              //* Loading widget
              return LoadingWidget();
            }
          },
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
