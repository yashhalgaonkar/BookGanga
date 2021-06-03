import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

/// TAB layout views to be displayed inside each tab
class ShareListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      //color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text('No Shares'),
    );
  }
}

class ReviewsListWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      //color: Colors.redAccent,
      alignment: Alignment.center,
      child: Text('No Reviews'),
    );
  }
}

class BlogListWidget extends StatelessWidget {
  final List<BlogToDisplay> blogs;

  const BlogListWidget({Key key, @required this.blogs}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (_, index) {
          return PostContainer(blog: blogs[index]);
        },
        itemCount: blogs.length,
      ),
    );
  }
}
