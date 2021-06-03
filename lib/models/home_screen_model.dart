import 'package:book_ganga/models/models.dart';
import 'package:flutter/cupertino.dart';

class HomeScreenModel {
  List<BlogToDisplay> blogs;
  List<UserToDisplay> userSuggetions;

  HomeScreenModel({
    @required this.blogs,
    @required this.userSuggetions,
  });
}
