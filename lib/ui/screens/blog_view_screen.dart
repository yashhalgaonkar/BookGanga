import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/post_image.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

import '../../data/data.dart';

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
                Hero(
                    tag: '${blog.titleImageUrl}',
                    child: PostImage(blog: blog, showGradient: false, showTitle: false)),
                Text(
                  '${blog.title}',
                  style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 25.0),
                ),
                Text('- ${blog.author.fname} ${blog.author.lname} ',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(color: Colors.white, backgroundColor: Colors.black)),

                //* Blog Text
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10.0),
                  child: Text(dummyBlogText),
                ),

                //* USer Detail Tile
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: BookGanga.kGrey),
                      borderRadius: BorderRadius.circular(10.0)),
                  padding: const EdgeInsets.all(4.0),
                  margin: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ProfileAvatar(
                        imageUrl: blog.author.profileImageUrl,
                        radius: 35.0,
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${blog.author.fname} ${blog.author.lname}',
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                            //Text(blog.author.username),
                            Text(
                              currentUser.bio,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            )
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Follow'),
                      )
                    ],
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
