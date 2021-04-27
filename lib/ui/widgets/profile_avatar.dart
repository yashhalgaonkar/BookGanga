import 'package:book_ganga/config/book_ganga.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

/// THis widget is used to show the profileAvater of the user everywhere
/// in [HomeScreen] to [UserProfileScreen] and all other moinor screens
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
    return CircleAvatar(
      radius: radius,
      backgroundColor: BookGanga.kAccentColor,
      child: CircleAvatar(
        radius: hasBorder ? radius - 2 : radius,
        backgroundColor: Colors.grey.shade200,
        backgroundImage: CachedNetworkImageProvider(imageUrl),
      ),
    );
  }
}
