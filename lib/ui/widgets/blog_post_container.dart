import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/BlogReadScreen/blog_read_screen.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/user_profile_screen.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';

/// Widget that contains the details of blog in [HomeScreen] and [UserProfileScreen]
class BlogContainer extends StatefulWidget {
  final BlogToDisplay blog;
  final bool paddingTop;

  BlogContainer({@required this.blog, this.paddingTop = false});

  @override
  _BlogContainerState createState() => _BlogContainerState();
}

class _BlogContainerState extends State<BlogContainer> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,

      // no padding at the button
      // equal padding at right and left
      // conditional padding at top
      padding: widget.paddingTop
          ? const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0)
          : const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Post header
          _PostHeader(blog: widget.blog),

          //* Post Image
          GestureDetector(
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => BlogViewScreen(
                        blog: widget.blog,
                      ),
                    ),
                  ),
              child: PostImage(blog: widget.blog)),

          //* Description
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
            child: Text(
              widget.blog.description,
              style: Theme.of(context).textTheme.bodyText1,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          //* Like and Comment count and the sharing and saving buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 2.0),
            child: _PostDetails(
              blog: widget.blog,
              isSaved: isSaved,
              onSavedTap: () {
                print('Saved Pressed');
                setState(() {
                  isSaved = !isSaved;
                });
              },
              onSendTap: () {
                print('send tapped');
              },
            ),
          ),

          //* Divider
          const Divider(
            thickness: 1.0,
            height: 20.0,
          ),
        ],
      ),
    );
  }
}

/// This widget contains likes share and save and share icon
class _PostDetails extends StatelessWidget {
  const _PostDetails(
      {Key key,
      this.isSaved = false,
      this.blog,
      @required this.onSavedTap,
      @required this.onSendTap})
      : super(key: key);

  final BlogToDisplay blog;
  final bool isSaved;
  final Function onSavedTap;
  final Function onSendTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      //color: Colors.red,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '${blog.numLikes} Likes and ${blog.numComments} Comments',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onSendTap,
                  child: Icon(
                    LineIcons.share,
                    size: 25.0,
                    color: BookGanga.kBlack,
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: onSavedTap,
                  child: Icon(
                    isSaved ? Ionicons.bookmark : Ionicons.bookmark_outline,
                    color: BookGanga.kBlack,
                    size: 25.0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

///Widget that contains the TOP ROW of the Container
///it contains profile avatar, username
///and icon for more options
class _PostHeader extends StatelessWidget {
  final BlogToDisplay blog;
  const _PostHeader({
    Key key,
    this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (_) => UserProfileScreen(user: blog.author),
        //   ),
        // );
      },
      child: Row(
        children: [
          ProfileAvatar(
            radius: 15.0,
            imageUrl: blog.authorImageUrl,
            hasBorder: false,
            isActive: false,
          ),
          const SizedBox(width: 10.0),
          Text(
            //blog.author.username,
            '${blog.authorName}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
