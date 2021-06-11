import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:book_ganga/viewmodels/community_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ClubMemberTab extends StatefulWidget {
  const ClubMemberTab({Key key}) : super(key: key);

  @override
  _ClubMemberTabState createState() => _ClubMemberTabState();
}

class _ClubMemberTabState extends State<ClubMemberTab> {
  Future<List<UserToDisplay>> _futureUserList;
  final CommunityVM _communityVM = GetIt.I<CommunityVM>();

  @override
  void initState() {
    super.initState();
    getUsers();
  }

  void getUsers() {
    _futureUserList = _communityVM.getMembersOfClub('dummy_club_id');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserToDisplay>>(
      future: _futureUserList,
      builder:
          (BuildContext context, AsyncSnapshot<List<UserToDisplay>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final _userList = snapshot.data;
            return Container(
              child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (BuildContext context, int index) {
                  final user = _userList[index];
                  bool isFollowing = false;
                  return ListTile(
                    onTap: () => print('Clicked'),
                    leading: ProfileAvatar(imageUrl: user.profileImageUrl),
                    title: Text(user.fname + ' ' + user.lname),
                    subtitle: Text('@' + user.username),
                    trailing: Container(
                      width: 100,
                      height: 35,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: isFollowing
                                  ? BookGanga.kBlack
                                  : Colors.transparent,
                              width: 1.0),
                          borderRadius: BorderRadius.circular(6)),
                      child: TextButton(
                        child: Text(isFollowing ? 'Following' : 'Follow'),
                        onPressed: () => print('Follow button pressed '),
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(isFollowing
                              ? Colors.white
                              : BookGanga.kAccentColor),
                          foregroundColor: MaterialStateProperty.all(isFollowing
                              ? BookGanga.kDarkBlack
                              : Colors.white),
                          overlayColor: 
                              MaterialStateProperty.all(Colors.transparent),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          } else
            return MyErrorWidget(
                errorMessage: snapshot.error, onRefresh: getUsers);
        } else
          return LoadingWidget();
      },
    );
  }
}
