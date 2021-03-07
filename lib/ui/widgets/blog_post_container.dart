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
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 3.0),
      elevation: 1.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Container(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //* Post header
            _PostHeader(blog: widget.blog),

            const SizedBox(height: 5.0),

            //* Post Image
            _PostImage(blog: widget.blog),

            //* Description
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 2.0, vertical: 4.0),
              child: Text(
                widget.blog.description,
                style: const TextStyle(
                  color: BookGanga.kDarkBlack,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

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
          ],
        ),
      ),
    );
  }
}

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
      child: Row(
        children: [
          Text(
            '${blog.readCount} Likes\n${blog.shareCount} Shares',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
            ),
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
            borderRadius: BorderRadius.circular(12.0),
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
              borderRadius: BorderRadius.circular(12.0),
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
          imageUrl: blog.author.profileImageUrl,
          hasBorder: false,
          isActive: false,
        ),
        const SizedBox(width: 15.0),
        Text(
          blog.author.username,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: BookGanga.kDarkBlack,
          ),
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
