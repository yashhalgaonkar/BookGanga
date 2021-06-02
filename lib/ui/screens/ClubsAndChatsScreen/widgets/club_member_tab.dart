import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class ClubMemberTab extends StatelessWidget {
  const ClubMemberTab({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemCount: dummyUser.length,
        itemBuilder: (BuildContext context, int index) {
          final user = dummyUser[index];
          bool isFollowing = false;
          return ListTile(
            onTap: () => print('Clicked'),
            leading: ProfileAvatar(imageUrl: currentUser.profileImageUrl),
            title: Text(user.fname + ' ' + user.lname),
            subtitle: Text('@' + user.username),
            trailing: Container(
              width: 100,
              height: 35,
              decoration: BoxDecoration(
                  border: Border.all(
                      color:
                          isFollowing ? BookGanga.kBlack : Colors.transparent,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(6)),
              child: TextButton(
                child: Text(isFollowing ? 'Following' : 'Follow'),
                onPressed: () => print('Follow button pressed '),
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
          );
        },
      ),
    );
  }
}
