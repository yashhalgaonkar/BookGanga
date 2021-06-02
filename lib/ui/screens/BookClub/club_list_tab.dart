import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/widgets/my_input_field.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:flutter/material.dart';

class ClubList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
          child: MyInputField(
            hintText: 'Search here...',
          ),
        ),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(10.0),
            child: ListView.builder(
                itemCount: 25,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    child: Column(
                      children: [
                        ListTile(
                          leading: ProfileAvatar(
                            imageUrl:
                                'https://www.vit.edu/images/Technical_chapter/trf-logo.jpg',
                            radius: 25,
                          ),
                          title: Text('TRF Book Club'),
                          subtitle: Text(
                              'Official book club of The Robotics Forum, VIT, Pune'),
                        ),
                        const Divider(),
                      ],
                    ),
                  );
                }),
          ),
        )
      ],
    );
  }
}
