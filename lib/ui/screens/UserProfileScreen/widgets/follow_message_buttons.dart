import 'package:book_ganga/config/book_ganga.dart';
import 'package:flutter/material.dart';

/// Follow and message button on the profile
class FollowAndMessageButton extends StatelessWidget {
  final bool isFollowing;
  final Function onFollowTap;
  final Function onMessageTap;
  const FollowAndMessageButton({
    @required this.isFollowing,
    @required this.onFollowTap,
    @required this.onMessageTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35.0,
      child: Row(
        children: [
          //* Follow button
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          isFollowing ? BookGanga.kBlack : Colors.transparent,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(6)),
              child: TextButton(
                child: Text(isFollowing ? 'Following' : 'Follow'),
                onPressed: onFollowTap,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(
                      isFollowing ? Colors.white : BookGanga.kAccentColor),
                  foregroundColor: MaterialStateProperty.all(
                      isFollowing ? BookGanga.kDarkBlack : Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: TextButton(
              child: Text('Message'),
              onPressed: onMessageTap,
              style: ButtonStyle(
                elevation: MaterialStateProperty.all(0.0),
                backgroundColor:
                    MaterialStateProperty.all(BookGanga.kAccentColor),
                foregroundColor: MaterialStateProperty.all(Colors.white),
                overlayColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed))
                      return BookGanga.kAccentColor.withOpacity(0.5);
                    return BookGanga.kAccentColor;
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
