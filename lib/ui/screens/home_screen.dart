import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../data/data.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    super.dispose();

    _trackingScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          controller: _trackingScrollController,
          slivers: [
            //*APP BAR
            SliverPadding(
              padding: const EdgeInsets.only(top: 4.0),
              sliver: CustomAppBar(),
            ),

            //* Featured Section

            // SliverPadding(
            //   padding: const EdgeInsets.fromLTRB(16.0, 10.0, 16.0, 10.0),
            //   sliver: SliverToBoxAdapter(
            //     child: GreetingWidget(
            //       fname: 'Yash',
            //       greeting: 'Good Evening!',
            //     ),
            //   ),
            // ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  //final Blog blog = blogs[index];
                  return BlogContainer();
                },
                childCount: 5,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MainGridTile extends StatelessWidget {
  final int index;
  const MainGridTile({Key key, this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight - 24) / 2 - 50;
    final double itemWidth = size.width / 2;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: BookGanga.kGrey,
      ),
      child: Stack(
        children: [
          //*new widget - to give image circular edges
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: Image.asset(
              'assets/images/dp2.png',
              height: itemHeight - 75.0,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          //* gradient to the story image
          Container(
            height: itemHeight - 75.0,
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: BookGanga.storyGradient,
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),

          Positioned(
            bottom: 55.0,
            //top: 8.0,
            left: 8.0,
            right: 8.0,
            child: Text(
              "A VIT boy hacks GitHub",
              style: const TextStyle(
                fontSize: 16.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          )
        ],
      ),
    );
  }
}


