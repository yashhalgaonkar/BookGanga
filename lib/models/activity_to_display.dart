import 'package:flutter/cupertino.dart';

class ActivityToDisplay {
  final ActivityType type;
  final String username;
  final String fname, lname;
  final String userImgUrl;
  final String blogImgUrl;
  final String blogId;
  final String blogTitle;

  ActivityToDisplay(
      {@required this.type,
      @required this.username,
      @required this.fname,
      @required this.lname,
      @required this.userImgUrl,
      @required this.blogImgUrl,
      @required this.blogTitle,
      this.blogId});

  factory ActivityToDisplay.fromJson(Map<String, dynamic> mp) {
    return ActivityToDisplay(
      type: (mp['type'] == 'LIKE')
          ? ActivityType.Like
          : (mp['type'] == 'COMMENT')
              ? ActivityType.Comment
              : ActivityType.Share,
      username: mp['username'],
      fname: mp['fname'],
      lname: mp['lname'],
      userImgUrl: mp['userImgUrl'],
      blogImgUrl: mp['blogImgUrl'],
      blogTitle: mp['blogTitle'],
    );
  }
}

enum ActivityType { Like, Comment, Share }
