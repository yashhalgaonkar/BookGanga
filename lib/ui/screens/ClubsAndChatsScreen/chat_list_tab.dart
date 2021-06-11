import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/error_widget.dart';
import 'package:book_ganga/ui/widgets/loading_widget.dart';
import 'package:book_ganga/ui/widgets/my_input_field.dart';
import 'package:book_ganga/ui/widgets/profile_avatar.dart';
import 'package:book_ganga/viewmodels/viewmodels.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  Future<List<UserToDisplay>> _futureChatList;
  final CommunityVM _communityVM = GetIt.I<CommunityVM>();

  void getChatList() {
    _futureChatList = _communityVM.getChatList('dummy_username');
  }

  @override
  void initState() {
    super.initState();
    getChatList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<UserToDisplay>>(
      future: _futureChatList,
      builder:
          (BuildContext context, AsyncSnapshot<List<UserToDisplay>> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final _chatList = snapshot.data;
            return Container(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
                    child: MyInputField(hintText: 'Search here..'),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      child: ListView.builder(
                        itemCount: _chatList.length * 10,
                        itemBuilder: (BuildContext context, int index) {
                          final user = _chatList[index % _chatList.length];
                          return ListTile(
                            leading:
                                ProfileAvatar(imageUrl: user.profileImageUrl),
                            title: Text('${user.fname} ${user.lname}'),
                            subtitle: Text('@${user.username}'),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          } else {
            return MyErrorWidget(
                errorMessage: snapshot.error, onRefresh: getChatList);
          }
        } else {
          return LoadingWidget();
        }
      },
    );
  }
}
