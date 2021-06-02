import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/ui/widgets/my_input_field.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: MyInputField(hintText: 'Search here..'),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: ListView.builder(
              itemCount: dummyUser.length,
              itemBuilder: (BuildContext context, int index) {
                final user = dummyUser[index];
                return ListTile(
                  leading: ProfileAvatar(imageUrl: user.profileImageUrl),
                  title: Text('${user.fname} ${user.lname}'),
                  subtitle: Text('@${user.username}'),
                );
              },
            ),
          ),
        )
      ],
    );
  }
}
