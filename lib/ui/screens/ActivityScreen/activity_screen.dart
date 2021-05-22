import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Activity',
          style: BookGanga.titleStyle,
        ),
        backgroundColor: BookGanga.scaffold,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: 25,
          itemBuilder: (context, index) {
            //TODO: Add fields to these variables
            final user = UserToDisplay(
                fname: 'Yash',
                lname: 'Halgaonkar',
                profileImageUrl:
                    'https://media-exp1.licdn.com/dms/image/C4E03AQEpsk7Ff1GdFw/profile-displayphoto-shrink_800_800/0/1593516152439?e=1626912000&v=beta&t=Pwv1wZKgtxnEZge1GBucHNJXDexO6JkyZiqvVDHsa40');
            final blog = BlogToDisplay();
            //return _NotificationTile();
            return ListTile(
              leading: ProfileAvatar(
                imageUrl: user.profileImageUrl,
                radius: 20,
              ),
              horizontalTitleGap: 10,
              title: RichText(
                text: TextSpan(children: [
                  TextSpan(
                      text: 'Yash Halgaonkar ',
                      style: Theme.of(context).textTheme.bodyText1),
                  TextSpan(
                      text: 'has liked your blog - ',
                      style: Theme.of(context).textTheme.bodyText2),
                  TextSpan(
                      text: 'Happiness or Hapyness',
                      style: Theme.of(context).textTheme.bodyText1),
                ]),
              ),
              // trailing: CachedNetworkImage(
              //   imageUrl:
              //       'https://images.unsplash.com/photo-1604346782646-13dac014c258?ixid=MXwxMjA3fDB8MHx0b3BpYy1mZWVkfDJ8Ym84alFLVGFFMFl8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60',
              //   height: 50.0,
              //   width: 50.0,
              //   fit: BoxFit.cover,
              // ),
            );
          },
        ),
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
