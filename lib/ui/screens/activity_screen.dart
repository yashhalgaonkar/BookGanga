import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
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
        elevation: 2.0,
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
            LabelWidget(label: 'This Week'),
            _NotificationTile(blog: blogs[0], user: currentUser),
            _NotificationTile(blog: blogs[1], user: users[1]),
            _NotificationTile(blog: blogs[2], user: users[2]),
            _NotificationTile(blog: blogs[3], user: users[3]),
            _NotificationTile(blog: blogs[4], user: users[4]),
            _NotificationTile(blog: blogs[5], user: users[5]),
            LabelWidget(label: 'This Month'),
            _NotificationTile(blog: blogs[6], user: users[6]),
            _NotificationTile(blog: blogs[7], user: users[7]),
            _NotificationTile(blog: blogs[8], user: users[8]),
            _NotificationTile(blog: blogs[9], user: users[9]),
            _NotificationTile(blog: blogs[0], user: users[0]),
            _NotificationTile(blog: blogs[1], user: users[1]),
            LabelWidget(label: 'Suggetions'),
            _ProfileSuggetionwidget(user: users[0]),
            _ProfileSuggetionwidget(user: users[1]),
            _ProfileSuggetionwidget(user: users[2]),
            _ProfileSuggetionwidget(user: users[3]),
            _ProfileSuggetionwidget(user: users[4]),
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
          title: Text(
            '${user.username}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
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
      child: Container(
        padding: const EdgeInsets.all(6.0),
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
              imageUrl: blog.titleImageUrl,
              height: 50.0,
              width: 50.0,
              fit: BoxFit.cover,
            )
          ],
        ),
      ),
    );
  }
}
