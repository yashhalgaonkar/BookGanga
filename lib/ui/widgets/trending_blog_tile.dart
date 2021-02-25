import 'package:flutter/material.dart';

class TrendingBlogTile extends StatelessWidget {
  const TrendingBlogTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Container(
                    child: Text(
                      'A VIT Boy hacks GitHub and deletes all JS repos.',
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                Image.asset(
                  'assets/images/dp.jpeg',
                  height: 80.0,
                  width: 80.0,
                  fit: BoxFit.cover,
                )
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: [
                        TextSpan(
                          text: 'James Bond',
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text('7/22/2020 - 4 min read'),
                ],
              ),
              Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.bookmark_border,
                      color: Colors.grey,
                    ),
                    SizedBox(
                      width: 15.0,
                    ),
                    Icon(
                      Icons.more_vert,
                      color: Colors.black87,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class NewWidget extends StatelessWidget {
  const NewWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //*Upper tile
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 4.0,
                  ),
                  //*List tile
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //*Details List
                        Expanded(
                          child: Container(
                            height: 120.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                //*Title
                                Text(
                                  'A VIT Boy hacks GitHub and deletes all JS repos.',
                                  style: TextStyle(
                                      fontSize: 16.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),

                                //* Summary
                                Text(
                                    'Yash Halgaonkar, 19, got so frustrated with JS that he decided to end it all.'),
                                //Icon(Icons.more_horiz)
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
                                'assets/images/dp.jpeg',
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
                ],
              ),
            ),

            //*More options tile
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        //Text('David Anaya in Money Heist'),
                        RichText(
                          text: TextSpan(
                            style: DefaultTextStyle.of(context).style,
                            children: [
                              TextSpan(
                                text: 'James Bond',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Text('7/22/2020 - 4 min read')
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.bookmark_border,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          Icons.more_vert,
                          color: Colors.black87,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),

            SizedBox(
              height: 4.0,
            ),

            Divider(
              color: Colors.grey,
            )
          ],
        ),
      ),
    );
  }
}
