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

// class MainGridTile extends StatelessWidget {
//   final int index;
//   const MainGridTile({Key key, this.index}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final Size size = MediaQuery.of(context).size;
//     final double itemHeight = (size.height - kToolbarHeight - 24) / 2 - 50;
//     final double itemWidth = size.width / 2;
//     return Container(
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         color: BookGanga.kGrey,
//       ),
//       child: Stack(
//         children: [
//           //*new widget - to give image circular edges
//           ClipRRect(
//             borderRadius: BorderRadius.circular(10.0),
//             child: Image.asset(
//               'assets/images/dp2.png',
//               height: itemHeight - 75.0,
//               width: double.infinity,
//               fit: BoxFit.cover,
//             ),
//           ),

//           //* gradient to the story image
//           Container(
//             height: itemHeight - 75.0,
//             width: double.infinity,
//             decoration: BoxDecoration(
//               gradient: BookGanga.storyGradient,
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//           ),

//           Positioned(
//             bottom: 55.0,
//             //top: 8.0,
//             left: 8.0,
//             right: 8.0,
//             child: Text(
//               "A VIT boy hacks GitHub",
//               style: const TextStyle(
//                 fontSize: 16.0,
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//               maxLines: 2,
//               overflow: TextOverflow.ellipsis,
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
