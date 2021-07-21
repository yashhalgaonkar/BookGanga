import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/blog_to_display.dart';
import 'package:book_ganga/ui/screens/BlogReadScreen/blog_read_screen.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:book_ganga/ui/widgets/post_image.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:line_icons/line_icons.dart';

class PostContainer extends StatefulWidget {
  final BlogToDisplay blog;

  PostContainer({this.blog});
  @override
  _PostContainerState createState() => _PostContainerState();
}

class _PostContainerState extends State<PostContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber.shade500,
      // padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 6.0),
      // margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),

      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.fromLTRB(6.0, 0.0, 6.0, 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Header
          GestureDetector(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => UserProfileScreen(
                        username: widget.blog.authorUsername))),
            child: Row(
              children: [
                ProfileAvatar(
                  radius: 16.0,
                  //imageUrl: widget.blog.authorImageUrl,
                  imageUrl: widget.blog.authorImageUrl,
                  hasBorder: false,
                  isActive: false,
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${widget.blog.authorName}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text(
                        '@${widget.blog.authorUsername}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            .copyWith(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    //* More options Menu
                    showModalBottomSheet(
                        backgroundColor: Colors.transparent,
                        shape: RoundedRectangleBorder(),
                        elevation: 10.0,
                        context: context,
                        builder: (context) {
                          return Container(
                            height: 200,
                            color: Colors.transparent,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: ListView(
                                children: [
                                  ModalListTile(
                                    title: 'Share',
                                    iconData: LineIcons.share,
                                    onTap: () =>
                                        Fluttertoast.showToast(msg: "Shared"),
                                  ),
                                  ModalListTile(
                                    title: 'Save for Later',
                                    iconData: LineIcons.bookmark,
                                    onTap: () =>
                                        Fluttertoast.showToast(msg: "Saved"),
                                  ),
                                  ModalListTile(
                                    title: 'Report',
                                    iconData: LineIcons.flag,
                                    onTap: () =>
                                        Fluttertoast.showToast(msg: "Reported"),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  },
                  child: Icon(
                    LineIcons.verticalEllipsis,
                    color: BookGanga.kDarkBlack,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 3.0),
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
            child: PostImage(blog: widget.blog),
          ),
          const SizedBox(height: 3.0),
          //* Description
          Container(
            child: Text(
              widget.blog.description,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 12.0),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),

          //* Likes and Comments
          Text('8,964 likes and 879 comments',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 12.0)),

          //* Time or Date
          Text('9 hrs',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 12.0)),
          // Container(
          //   height: 1.0,
          //   color: Colors.black12,
          //   margin: const EdgeInsets.symmetric(vertical: 10.0),
          // ),
        ],
      ),
    );
  }
}

/// This is the ListTile displayed in the list
/// when user clicked on three vertical dots
/// for more options
class ModalListTile extends StatelessWidget {
  final String title;
  final IconData iconData;
  final Function onTap;
  const ModalListTile({
    Key key,
    this.title,
    this.iconData,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      title: Text(title, style: Theme.of(context).textTheme.bodyText1),
      horizontalTitleGap: 0.0,
      leading: Icon(
        iconData,
        color: BookGanga.kDarkBlack,
      ),
    );
  }
}
