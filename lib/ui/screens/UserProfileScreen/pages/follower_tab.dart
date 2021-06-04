import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:book_ganga/viewmodels/user_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:line_icons/line_icons.dart';

class FollowerList extends StatefulWidget {
  @override
  _FollowerListState createState() => _FollowerListState();
}

class _FollowerListState extends State<FollowerList> {
  final TextEditingController _textEditingController = TextEditingController();
  Future<List<UserToDisplay>> _future;
  final UserProfileVM _userProfileVM = GetIt.I<UserProfileVM>();

  @override
  void initState() {
    super.initState();
    getFollowers();
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }

  void getFollowers() {
    _future = _userProfileVM.getFollowerForUser('dummy_username');
  }

  /// passed to the text field
  /// called everytime text in the input field is chaged
  void onTextChange(String value) {
    // print('called onTextChange with value $value');
    // setState(() {
    //   //tempUserList.clear();
    //   for (var user in dummyUser) {
    //     if (user.fname.contains(value) ||
    //         user.lname.contains(value) ||
    //         user.username.contains(value)) tempUserList.add(user);
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserToDisplay>>(
        future: _future,
        builder: (BuildContext context,
            AsyncSnapshot<List<UserToDisplay>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final followers = snapshot.data;
              return Container(
                child: Column(
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
                            '${followers.length*10}',
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
                      itemCount: followers.length * 10,
                      itemBuilder: (BuildContext context, int index) {
                        return HorizontalUserTile(
                          isFollowing: false,
                          showFollowButton: true,
                          user: followers[index % followers.length],
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
                    )),
                  ],
                ),
              );
            } else
              return MyErrorWidget(
                errorMessage: snapshot.error,
                onRefresh: getFollowers,
              );
          } else
            return LoadingWidget();
        });
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
      leading: ProfileAvatar(imageUrl: user.profileImageUrl),
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
