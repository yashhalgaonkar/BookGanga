import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/post_image.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../../data/data.dart';

class BlogViewScreen extends StatelessWidget {
  final Blog blog;

  BlogViewScreen({@required this.blog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                PostImage(
                  blog: blog,
                  showGradient: false,
                  showTitle: false,
                  height: 250.0,
                ),
                Text(
                  '${blog.title}',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 25.0),
                ),
                Text('- ${blog.author.fname} ${blog.author.lname} ',
                    style: Theme.of(context).textTheme.bodyText1.copyWith(
                        color: Colors.white, backgroundColor: Colors.black)),

                //* Blog Text
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 8.0, vertical: 10.0),
                  child: Text(
                    dummyBlogText,
                    style: TextStyle(fontSize: 16.0),
                  ),
                ),

                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
