import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/user_details_widget.dart';
import 'package:flutter/material.dart';

class FollowerList extends StatelessWidget {
  final User user;

  FollowerList({this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.fname}\'s Followers'),
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) => UserDetailsWidget(
          user: users[index],
          compactView: true,
        ),
      ),
    );
  }
}
