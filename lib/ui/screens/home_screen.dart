import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:flutter/material.dart';
import '../widgets/widgets.dart';

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

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final Blog blog = blogs[index];
                  return BlogContainer(blog: blog);
                },
                childCount: blogs.length,
              ),
            )
          ],
        ),
      ),
    );
  }
}
