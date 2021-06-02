import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class FollowerList extends StatefulWidget {
  @override
  _FollowerListState createState() => _FollowerListState();
}

class _FollowerListState extends State<FollowerList> {
  final TextEditingController _textEditingController = TextEditingController();

  List<UserToDisplay> tempUserList = dummyUser;

  /// passed to the text field
  /// called everytime text in the input field is chaged
  void onTextChange(String value) {
    print('called onTextChange with value $value');
    setState(() {
      //tempUserList.clear();
      for (var user in dummyUser) {
        if (user.fname.contains(value) ||
            user.lname.contains(value) ||
            user.username.contains(value)) tempUserList.add(user);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 60,
          width: double.infinity,
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(LineIcons.userFriends),
              const SizedBox(width: 5),
              Text(
                '${dummyUser.length}',
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          child: MyInputField(
            hintText: 'Search...',
            textEditingController: _textEditingController,
            onChange: onTextChange,
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: tempUserList.length,
            itemBuilder: (BuildContext context, int index) {
              return HorizontalUserTile(
                isFollowing: false,
                showFollowButton: true,
                user: tempUserList[index],
                onTap: () {
                  // take them to userProfile screen
                },
                onButtonTap: () {
                  // make a follow requrest
                  // setState(() {
                  //   isFollowing = !isFollowing;
                  // });
                },
              );
            },
          ),
        )
      ],
    );
  }
}


class HorizontalUserTile extends StatelessWidget {
  const HorizontalUserTile(
      {Key key,
      this.user,
      @required this.isFollowing,
      @required this.showFollowButton,
      @required this.onButtonTap,
      @required this.onTap})
      : super(key: key);

  final UserToDisplay user;
  final bool isFollowing;
  final bool showFollowButton;
  final Function onTap;
  final Function onButtonTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: ProfileAvatar(imageUrl: currentUser.profileImageUrl),
      title: Text(user.fname + ' ' + user.lname),
      subtitle: Text('@' + user.username),
      trailing: showFollowButton
          ? Container(
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
                onPressed: onButtonTap,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0.0),
                  backgroundColor: MaterialStateProperty.all(
                      isFollowing ? Colors.white : BookGanga.kAccentColor),
                  foregroundColor: MaterialStateProperty.all(
                      isFollowing ? BookGanga.kDarkBlack : Colors.white),
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
              ),
            )
          : const SizedBox(),
    );
  }
}

