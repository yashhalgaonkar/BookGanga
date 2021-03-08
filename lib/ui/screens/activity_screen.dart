import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
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
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20.0),
        ),
        backgroundColor: BookGanga.scaffold,
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _FollowListwidget(),
            _LabelWidget(label: 'This Week'),
            _NotificationTile(blog: blogs[0], user: currentUser),
            _NotificationTile(blog: blogs[1], user: userList[1]),
            _NotificationTile(blog: blogs[2], user: userList[2]),
            _NotificationTile(blog: blogs[3], user: userList[3]),
            _NotificationTile(blog: blogs[4], user: userList[4]),
            _NotificationTile(blog: blogs[5], user: userList[5]),
            _LabelWidget(label: 'This Month'),
            _NotificationTile(blog: blogs[6], user: userList[6]),
            _NotificationTile(blog: blogs[7], user: userList[7]),
            _NotificationTile(blog: blogs[8], user: userList[8]),
            _NotificationTile(blog: blogs[9], user: userList[9]),
            _NotificationTile(blog: blogs[0], user: userList[0]),
            _NotificationTile(blog: blogs[1], user: userList[1]),
            _LabelWidget(label: 'Suggetions'),
            _ProfileSuggetionwidget(user: userList[0]),
            _ProfileSuggetionwidget(user: userList[1]),
            _ProfileSuggetionwidget(user: userList[2]),
            _ProfileSuggetionwidget(user: userList[3]),
            _ProfileSuggetionwidget(user: userList[4]),
          ],
        ),
      ),
    );
  }
}

class _ProfileSuggetionwidget extends StatelessWidget {
  final User user;

  const _ProfileSuggetionwidget({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        child: ListTile(
          leading: ProfileAvatar(
            imageUrl: user.profileImageUrl,
          ),
          title: Text('${user.username}'),
          trailing: TextButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(BookGanga.kAccentColor),
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
      ),
    );
  }
}

class _FollowListwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
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
      ),
    );
  }
}

class _NotificationTile extends StatelessWidget {
  final Blog blog;
  final User user;

  const _NotificationTile({
    Key key,
    this.blog,
    this.user,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Card(
        margin: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Container(
          padding: const EdgeInsets.all(6.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ProfileAvatar(imageUrl: user.profileImageUrl),
              const SizedBox(width: 15.0),
              Expanded(
                child:
                    Text('${user.username} has liked you blog - ${blog.title}'),
              ),
              const SizedBox(width: 15.0),
              CachedNetworkImage(
                imageUrl: blog.titleImageUrl,
                height: 50.0,
                width: 50.0,
                fit: BoxFit.cover,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class _LabelWidget extends StatelessWidget {
  final String label;

  const _LabelWidget({Key key, this.label}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        margin: const EdgeInsets.only(top: 6.0),
        color: Colors.white,
        padding: const EdgeInsets.all(6.0),
        child: Text(
          label,
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 18.0),
        ),
      ),
    );
  }
}
