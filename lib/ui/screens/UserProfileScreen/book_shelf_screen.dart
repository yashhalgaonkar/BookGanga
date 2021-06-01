import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/ui/widgets/my_input_field.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class BookShelfScreen extends StatelessWidget {
  final isFollowing = false;
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
          // Container(
          //   height: 60,
          //   width: double.infinity,
          //   alignment: Alignment.center,
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Icon(Ionicons.people),
          //       const SizedBox(width: 5),
          //       Text(
          //         '125',
          //         style: Theme.of(context)
          //             .textTheme
          //             .bodyText1
          //             .copyWith(fontWeight: FontWeight.w600),
          //       )
          //     ],
          //   ),
          // ),
          Container(
            margin: const EdgeInsets.all(10.0),
            child: MyInputField(),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 25,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: ProfileAvatar(imageUrl: currentUser.profileImageUrl),
                  title: Text('Yash Halgaonkar'),
                  subtitle: Text('@yash.halgaonkar'),
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
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0.0),
                        backgroundColor: MaterialStateProperty.all(isFollowing
                            ? Colors.white
                            : BookGanga.kAccentColor),
                        foregroundColor: MaterialStateProperty.all(
                            isFollowing ? BookGanga.kDarkBlack : Colors.white),
                        overlayColor:
                            MaterialStateProperty.all(Colors.transparent),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
