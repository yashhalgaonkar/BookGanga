import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/my_input_field.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class UserDetailScreen extends StatefulWidget {
  @override
  _UserDetailScreenState createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen>
    with SingleTickerProviderStateMixin {
  bool isFollowing = false;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: BookGanga.kDarkBlack),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: Colors.white,
        title: Text('Yash\'s Books',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 16, fontWeight: FontWeight.w600)),
      ),
      body: Column(
        children: [
          MyTabBar(
            tabController: _tabController,
            context: context,
            tabs: [
              Tab(text: 'Followers'),
              Tab(text: 'BookShelf'),
              Tab(text: 'Wish List'),
            ],
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _FollowerList(),
                _BookShelfList(),
                _WishListList(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _FollowerList extends StatelessWidget {
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
              Icon(Ionicons.people),
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
          child: MyInputField(),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: dummyUser.length,
            itemBuilder: (BuildContext context, int index) {
              return HorizontalUserTile(
                isFollowing: false,
                showFollowButton: true,
                user: dummyUser[index],
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

class _WishListList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class _BookShelfList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
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
