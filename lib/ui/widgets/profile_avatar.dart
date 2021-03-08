import 'package:book_ganga/config/book_ganga.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final bool isActive;
  final bool hasBorder;
  final double radius;

  const ProfileAvatar(
      {Key key,
      @required this.imageUrl,
      this.isActive = false,
      this.hasBorder = false,
      this.radius = 20.0 // default radius
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //for the blue border
        CircleAvatar(
          radius: radius,
          backgroundColor: BookGanga.kAccentColor,
          child: CircleAvatar(
            radius: hasBorder ? radius - 2 : radius,
            backgroundColor: Colors.grey.shade200,
            backgroundImage: CachedNetworkImageProvider(imageUrl),
          ),
        ),

        //the green dot
        isActive
            ? Positioned(
                bottom: 0.0,
                right: 0.0,
                child: Container(
                  height: 15.0,
                  width: 15.0,
                  decoration: BoxDecoration(
                      color: BookGanga.online,
                      shape: BoxShape.circle,
                      border: Border.all(width: 2.0, color: Colors.white)),
                ),
              )
            : const SizedBox.shrink()
      ],
    );
  }
}
