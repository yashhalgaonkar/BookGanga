import 'package:flutter/material.dart';
import '../../config/book_ganga.dart';
import '../widgets/widgets.dart';
import '../../data/data.dart';
import '../../models/models.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TrackingScrollController _trackingScrollController =
      TrackingScrollController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _trackingScrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _trackingScrollController,
        slivers: [
          //*APP BAR
          CustomAppBar(),

          //* Featured Section

          SliverToBoxAdapter(
            child: CreateSection(
              title: 'Featured',
              blogList: featuredBlogList,
            ),
          ),

          SliverToBoxAdapter(
            child: CreateSection(
              title: 'Trending',
              blogList: featuredBlogList,
            ),
          ),

          SliverToBoxAdapter(
            child: CreateSection(
              title: 'Recommendations',
              blogList: featuredBlogList,
            ),
          ),
        ],
      ),
    );
  }
}

// //*NOT USING
// class SliverDivider extends StatelessWidget {
//   const SliverDivider({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return SliverPadding(
//       padding: const EdgeInsets.symmetric(horizontal: 16.0),
//       sliver: SliverToBoxAdapter(
//         child: const Divider(
//           height: 1.0,
//         ),
//       ),
//     );
//   }
// }

// //*Not using
// class GreetingWidget extends StatelessWidget {
//   final String fname;
//   final String greeting;

//   GreetingWidget({
//     this.fname,
//     this.greeting,
//   });
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 2.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             'Hi $fname',
//             style: TextStyle(fontSize: 18.0),
//           ),
//           Text(
//             "$greeting",
//             style: TextStyle(
//               fontSize: 25.0,
//               color: Colors.black,
//               fontWeight: FontWeight.w700,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
