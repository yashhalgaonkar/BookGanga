import 'package:flutter/material.dart';
import '../../models/models.dart';

class FeaturedBlogTile extends StatelessWidget {
  final Blog blog;
  const FeaturedBlogTile({
    Key key,
    this.blog,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //*Details List
            Expanded(
              child: Container(
                height: 100.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      'A VIT Boy hacks GitHub and deletes all JS repos.',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text('James Bond - 9 min read'),
                    Icon(Icons.more_horiz_outlined)
                  ],
                ),
              ),
            ),

            //*
            SizedBox(
              width: 10.0,
            ),

            //*Image
            Padding(
              padding: const EdgeInsets.only(left: 4.0),
              child: Stack(
                children: [
                  Image.asset(
                    'assets/images/dp2.png',
                    height: 100.0,
                    width: 100.0,
                    fit: BoxFit.cover,
                  ),
                  // Positioned(
                  //   bottom: 0.0,
                  //   child: Image.asset(
                  //     'assets/images/placeholder.png',
                  //     height: 25.0,
                  //     width: 25.0,
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
