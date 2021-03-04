import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class BlogContainer extends StatefulWidget {
  final Blog blog;

  BlogContainer({this.blog});

  @override
  _BlogContainerState createState() => _BlogContainerState();
}

class _BlogContainerState extends State<BlogContainer> {
  bool isSaved = true;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
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
            _PostHeader(),

            //* Post Image
            _PostImage(),

            //* Description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: Text(
                loren,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),

            const Divider(
              height: 8.0,
              color: Colors.black26,
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: _PostDetails(
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
      @required this.onSavedTap,
      @required this.onSendTap})
      : super(key: key);

  final bool isSaved;
  final Function onSavedTap;
  final Function onSendTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Text(
            '457 Reads\n105 Shares',
            style: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  onTap: onSendTap,
                  child: Icon(
                    MdiIcons.sendCircleOutline,
                    size: 25.0,
                  ),
                ),
                const SizedBox(width: 10.0),
                InkWell(
                  onTap: onSavedTap,
                  child: Icon(
                    (isSaved) ? MdiIcons.bookmark : MdiIcons.bookmarkOutline,
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
  const _PostImage({
    Key key,
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
              imageUrl: postUrl,
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
                'Ikigia - A way of living',
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
  const _PostHeader({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ProfileAvatar(
          imageUrl: currentUser.imageURL,
          hasBorder: false,
          isActive: true,
        ),
        const SizedBox(width: 10.0),
        Text(
          'yash.halgaonkar',
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.centerRight,
            child: Icon(
              Icons.more_vert_rounded,
            ),
          ),
        ),
      ],
    );
  }
}
