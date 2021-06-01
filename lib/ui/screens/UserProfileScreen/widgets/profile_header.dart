import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/UserProfileScreen/widgets/stats_row.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

import 'follow_message_buttons.dart';

/// The main header of the profile screen
/// with Profile image, Name, bio, stats
/// and follow and like button
///
///
///

class UserProfileHeader extends StatefulWidget {
  final UserToDisplay user;
  bool isFollowing;

  UserProfileHeader({
    @required this.user,
    @required this.isFollowing,
  });

  @override
  _UserProfileHeaderState createState() => _UserProfileHeaderState();
}

class _UserProfileHeaderState extends State<UserProfileHeader> {
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
            imageUrl:
                'https://media-exp1.licdn.com/dms/image/C4E03AQEpsk7Ff1GdFw/profile-displayphoto-shrink_800_800/0/1593516152439?e=1626912000&v=beta&t=Pwv1wZKgtxnEZge1GBucHNJXDexO6JkyZiqvVDHsa40',
            radius: 45.0,
          ),
          const SizedBox(height: 5.0),
          //* Full Display name of the user
          Text(
            '${widget.user.fname} ${widget.user.lname}',
            //'Aditya Giradkar',
            // style: Theme.of(context)
            //     .textTheme
            //     .bodyText1
            //     .copyWith(fontWeight: FontWeight.w600),
            style: BookGanga.titleStyle,
          ),

          Text('@${widget.user.username}',
              style: Theme.of(context).textTheme.bodyText1),
          const SizedBox(height: 5.0),
          //* bio
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              widget.user.bio,
              //user.bio,
              style: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 12.0,
                  ),
              textAlign: TextAlign.center,
              maxLines: 2,
            ),
          ),

          StatsRow(user: widget.user),

          FollowAndMessageButton(
            isFollowing: widget.isFollowing,
            onFollowTap: () {
              setState(() {
                widget.isFollowing = !widget.isFollowing;
              });
            },
            onMessageTap: () {},
          ),
        ],
      ),
    );
  }
}

