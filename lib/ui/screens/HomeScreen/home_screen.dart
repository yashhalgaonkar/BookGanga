import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BookGanga',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: BookGanga.kDarkBlack, fontSize: 24.0),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.format_quote_sharp,
          color: BookGanga.kDarkBlack,
          size: 24.0,
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {},
            color: BookGanga.kDarkBlack,
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {},
            color: BookGanga.kDarkBlack,
          ),
        ],
      ),
      body: SafeArea(
        // child: CustomScrollView(
        //   controller: _trackingScrollController,
        //   slivers: [
        //     //*APP BAR
        //     SliverPadding(
        //       padding: const EdgeInsets.only(top: 4.0),
        //       sliver: CustomAppBar(),
        //     ),

        //     SliverList(
        //       delegate: SliverChildBuilderDelegate(
        //         (context, index) {
        //           final Blog blog = blogs[index];
        //           if (index == 0)
        //             return BlogContainer(blog: blog, paddingTop: true);
        //           else
        //             return BlogContainer(blog: blog);
        //         },
        //         childCount: blogs.length,
        //       ),
        //     )
        //   ],
        // ),
        //
        child: ListView.builder(
            itemBuilder: (_, index) {
              final Blog blog = blogs[index];
              if (index == 0)
                return BlogContainer(blog: blog, paddingTop: true);
              else
                return BlogContainer(blog: blog, paddingTop: false);
            },
            //separatorBuilder: (_, index) {},
            itemCount: blogs.length),
      ),
    );
  }
}
