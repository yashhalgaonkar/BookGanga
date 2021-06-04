import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/blog_to_display.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:book_ganga/viewmodels/activity_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  final ActivityScreenVM _activityScreenVM = GetIt.I<ActivityScreenVM>();
  Future<List<ActivityToDisplay>> _futureActivity;

  @override
  void initState() {
    super.initState();
    getActivities();
  }

  void getActivities() {
    _futureActivity = _activityScreenVM.getActivityOfUser('dummy_username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: true,
        title: Text(
          'Activity',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 16),
        ),
        backgroundColor: BookGanga.scaffold,
      ),
      body: SafeArea(
        child: FutureBuilder(
            future: _futureActivity,
            builder: (BuildContext context,
                AsyncSnapshot<List<ActivityToDisplay>> snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                if (snapshot.hasData) {
                  final activities = snapshot.data;
                  return ListView.builder(
                    itemCount: activities.length * 10,
                    itemBuilder: (context, index) {
                      final activity = activities[index % activities.length];
                      //TODO: Add fields to these variables
                      //return _NotificationTile();
                      return ListTile(
                        contentPadding: const EdgeInsets.all(10.0),
                        dense: true,
                        onTap: () => print('Tapped'),
                        leading: ProfileAvatar(
                          imageUrl: activity.userImgUrl,
                          radius: 20,
                        ),
                        horizontalTitleGap: 10,
                        title: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                                text: '${activity.fname} ${activity.lname} ',
                                style: Theme.of(context).textTheme.bodyText1),
                            TextSpan(
                                text: 'has liked your blog - ',
                                style: Theme.of(context).textTheme.bodyText2),
                            TextSpan(
                                text: '${activity.blogTitle}',
                                style: Theme.of(context).textTheme.bodyText1),
                          ]),
                        ),
                        trailing: CachedNetworkImage(
                          imageUrl: activity.blogImgUrl,
                          height: 50.0,
                          width: 50.0,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                } else
                  return MyErrorWidget(
                      errorMessage: snapshot.error, onRefresh: getActivities);
              } else
                return LoadingWidget();
            }),
      ),
    );
  }
}

/// This widget will be used to suggest profiles to follow
class _ProfileSuggetionWidget extends StatelessWidget {
  final UserToDisplay user;

  const _ProfileSuggetionWidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: ListTile(
        leading: ProfileAvatar(
          imageUrl: user.profileImageUrl,
        ),
        title: Text(
          '${user.fname} ${user.lname}',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        trailing: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(BookGanga.kAccentColor),
          ),
          onPressed: () {
            print('Follow clicked');
          },
          child: Text(
            'Follow',
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class _FollowerRequestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red,
            child: Text(
              '9+',
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(color: Colors.white),
            ),
          ),
          title: Text('Follow Requests'),
          subtitle: Text('Approve or Ignore Requests'),
          contentPadding: const EdgeInsets.all(0.0),
        ),
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final BlogToDisplay blog;
  final UserToDisplay user;

  const _NotificationTile({
    Key key,
    this.blog,
    this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ProfileAvatar(imageUrl: user.profileImageUrl),
          const SizedBox(width: 15.0),
          Expanded(
              child:
                  //Text('${user.username} has liked you blog - ${blog.title}'),
                  RichText(
            text: TextSpan(children: [
              TextSpan(
                  text: '${user.username} ',
                  style: Theme.of(context).textTheme.bodyText1),
              TextSpan(
                  text: 'has liked your blog - ',
                  style: Theme.of(context).textTheme.bodyText2),
              TextSpan(
                  text: '${blog.title}',
                  style: Theme.of(context).textTheme.bodyText1),
            ]),
          )),
          const SizedBox(width: 15.0),
          CachedNetworkImage(
            imageUrl: blog.blogHeaderImageUrl,
            height: 50.0,
            width: 50.0,
            fit: BoxFit.cover,
          )
        ],
      ),
    );
  }
}
