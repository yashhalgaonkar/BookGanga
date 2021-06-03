import 'package:book_ganga/models/models.dart';
import 'package:flutter/cupertino.dart';

class UserToDisplay {
  String fname;
  String lname;
  String profileImageUrl;
  String username;
  String bio;
  int numFollowers;
  int numBlogs;
  int numReviews;
  int numShares;
  int numBookShelf;
  int numWishList;
  bool isFollowing;

  List<BlogToDisplay> blogs;
  List<BlogToDisplay> sharedBlogs;
  List<BlogToDisplay> reviews;

  UserToDisplay(
      {@required this.fname,
      @required this.lname,
      @required this.profileImageUrl,
      this.username,
      this.bio,
      this.numFollowers,
      this.numBlogs,
      this.numReviews,
      this.numShares,
      this.numBookShelf,
      this.numWishList,
      this.blogs,
      this.reviews,
      this.sharedBlogs,
      this.isFollowing});

  factory UserToDisplay.fromJson(Map<String, dynamic> mp) {
    return UserToDisplay(
        fname: mp['fname'],
        lname: mp['lname'],
        profileImageUrl: mp['profileImageUrl'],
        username: mp['username'],
        bio: mp['bio'],
        numFollowers: mp['numFollowers'],
        numBlogs: mp['numBlogs'],
        numReviews: mp['numReviews'],
        numShares: mp['numShares'],
        numBookShelf: mp['numBookShelf'],
        numWishList: mp['numWishList'],
        isFollowing: mp['isFollowing']);
  }
}
