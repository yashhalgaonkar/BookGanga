import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/screens.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';

class UserDetailsWidget extends StatelessWidget {
  final User user;
  final bool compactView;

  UserDetailsWidget({@required this.user, this.compactView = false});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => UserProfileScreen(user: user)));
      },
      child: Container(
        decoration: !compactView
            ? BoxDecoration(
                border: Border.all(color: BookGanga.kGrey),
                borderRadius: BorderRadius.circular(8.0))
            : null,
        padding: const EdgeInsets.all(4.0),
        margin: const EdgeInsets.symmetric(vertical: 2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileAvatar(
              imageUrl: user.profileImageUrl,
              radius: compactView ? 20.0 : 35.0,
            ),
            const SizedBox(width: 10.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${user.fname} ${user.lname}',
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  //Text(blog.author.username),
                  Text(
                    currentUser.bio,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  )
                ],
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Text('Follow'),
            )
          ],
        ),
      ),
    );
  }
}
