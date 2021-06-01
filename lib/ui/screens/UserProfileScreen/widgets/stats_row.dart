import 'package:book_ganga/models/models.dart';
import 'package:flutter/material.dart';

/// This widget tells that stats of the user
/// Number of follwers, number of books in bookshelf and wish list
class StatsRow extends StatelessWidget {
  final UserToDisplay user;

  StatsRow({@required this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.amber,
      margin: const EdgeInsets.symmetric(vertical: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _StatsWidgetTile(
              label: 'Followers',
              count: '${user.numFollowers}',
              onClick: () => print('Followers Clicked')),
          _StatsWidgetTile(
              label: 'Book Shelf',
              count: '${user.numBookShelf}',
              onClick: () => print('BookShelf Clicked')),
          _StatsWidgetTile(
              label: 'Wish List',
              count: '${user.numWishList}',
              onClick: () => print('WishList Clicked')),
        ],
      ),
    );
  }
}

/// Individual Tile in the stats
class _StatsWidgetTile extends StatelessWidget {
  final String label;
  final String count;
  final Function onClick;

  const _StatsWidgetTile({
    Key key,
    @required this.label,
    @required this.count,
    @required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        height: 35.0,
        //color: Colors.green,
        //padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              alignment: Alignment.center,
              child: Text(count,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 12.0)),
            ),
            Text(
              label,
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  .copyWith(fontSize: 12.0),
            ),
          ],
        ),
      ),
    );
  }
}
