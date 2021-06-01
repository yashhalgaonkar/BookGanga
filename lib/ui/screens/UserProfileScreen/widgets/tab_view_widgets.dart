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
  final BlogToDisplay blog = BlogToDisplay(
      authorImageUrl: '',
      authorName: 'Yash Halgaonkar',
      title: 'Happyness or Happiness',
      blogHeaderImageUrl:
          'https://images.unsplash.com/photo-1604346782646-13dac014c258?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60');
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        padding: const EdgeInsets.only(top: 10.0),
        itemBuilder: (_, index) {
          return PostContainer(blog: blog);
        },
        itemCount: 25,
      ),
    );
  }
}
