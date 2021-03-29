import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class BlogContainer extends StatefulWidget {
  final Blog blog;

  BlogContainer({@required this.blog});

  @override
  _BlogContainerState createState() => _BlogContainerState();
}

class _BlogContainerState extends State<BlogContainer> {
  bool isSaved = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      //margin: const EdgeInsets.symmetric(horizontal: 4.0),
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Post header
          _PostHeader(blog: widget.blog),

          //* Post Image
          _PostImage(blog: widget.blog),

          //* Description
          Padding(
            padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 0.0),
            child: Text(
              widget.blog.description,
              style: Theme.of(context).textTheme.bodyText2,
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
            height: 20.0,
            thickness: 1.0,
          ),
        ],
      ),
    );
  }
}

/**
 * This widget contains the Like and the Comment count and the share and save icons
 */
class _PostDetails extends StatelessWidget {
  const _PostDetails(
      {Key key,
      this.isSaved = false,
      this.blog,
      @required this.onSavedTap,
      @required this.onSendTap})
      : super(key: key);

  final Blog blog;
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
          Icon(MdiIcons.heartOutline, size: 15.0),
          Text(
            ' ${blog.readCount}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(width: 5.0),
          Icon(MdiIcons.commentOutline, size: 15.0),
          Text(
            ' ${blog.shareCount}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onSendTap,
                  child: Icon(
                    Icons.send,
                    size: 25.0,
                    color: BookGanga.kBlack,
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: onSavedTap,
                  child: Icon(
                    (isSaved) ? MdiIcons.bookmark : MdiIcons.bookmarkOutline,
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

class _PostImage extends StatelessWidget {
  final Blog blog;
  const _PostImage({
    Key key,
    this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double textBoxwidth = size.width * 2 / 3;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: CachedNetworkImage(
              imageUrl: blog.titleImageUrl,
              fit: BoxFit.cover,
              height: 200.0,
              width: double.infinity,
            ),
          ),
          Container(
            height: 200.0,
            width: double.infinity,
            decoration: BoxDecoration(
              // color: Colors.amber,
              gradient: BookGanga.storyGradient,
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          Positioned(
            bottom: 8.0,
            left: 8.0,
            child: Container(
              width: textBoxwidth,
              child: Text(
                blog.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.white,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          )
        ],
      ),
    );
  }
}

/**
 * This Widget contains  the TOP part of the COntainner
 * It contains the Profile Picture
 * then the username
 * and an icons for more options
 */
class _PostHeader extends StatelessWidget {
  final Blog blog;
  const _PostHeader({
    Key key,
    this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          radius: 15.0,
          imageUrl: blog.author.profileImageUrl,
          hasBorder: false,
          isActive: false,
        ),
        const SizedBox(width: 10.0),
        Text(
          blog.author.username,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_vert_rounded,
              color: BookGanga.kBlack,
            ),
          ),
        ),
      ],
    );
  }
}
