import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/widgets/stats_row.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'follow_message_buttons.dart';

/// The main header of the profile screen
/// with Profile image, Name, bio, stats
/// and follow and like button

class UserProfileHeader extends StatelessWidget {
  final UserToDisplay user;
  final bool isFollowing;
  final Function onFollowTap, onMessageTap;
  UserProfileHeader({
    @required this.user,
    @required this.isFollowing, this.onFollowTap, this.onMessageTap,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatar(
            //imageUrl: user.profileImageUrl,
            imageUrl: user.profileImageUrl,
            radius: 45.0,
          ),
          const SizedBox(height: 5.0),
          //* Full Display name of the user
          Text(
            '${user.fname} ${user.lname}',
            //'Aditya Giradkar',
            // style: Theme.of(context)
            //     .textTheme
            //     .bodyText1
            //     .copyWith(fontWeight: FontWeight.w600),
            style: BookGanga.titleStyle,
          ),

          Text('@${user.username}',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 5.0),
          //* bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              user.bio,
              //user.bio,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12.0,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),

          StatsRow(user: user),

          FollowAndMessageButton(
            isFollowing: isFollowing,
            onFollowTap: onFollowTap,
            onMessageTap: onMessageTap,
          ),
        ],
      ),
    );
  }
}
