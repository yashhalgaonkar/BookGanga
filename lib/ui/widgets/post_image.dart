import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PostImage extends StatelessWidget {
  final Blog blog;
  final bool showGradient;
  final bool showTitle;
  const PostImage({
    this.blog,
    this.showGradient = true,
    this.showTitle = true,
  });

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
          showGradient
              ? Container(
                  height: 200.0,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    // color: Colors.amber,
                    gradient: BookGanga.storyGradient,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                )
              : Container(),
          showTitle
              ? Positioned(
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
              : Container(),
        ],
      ),
    );
  }
}
