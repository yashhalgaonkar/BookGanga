import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DiscoverBooksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        centerTitle: false,
        title: Text(
          'Discover Books',
          style: Theme.of(context).textTheme.bodyText1.copyWith(fontSize: 20.0),
        ),
        backgroundColor: BookGanga.scaffold,
      ),
      body: CustomScrollView(
        slivers: [
          _SearchBox(),
          LabelWidget(
            label: 'Popular',
            sublabel: 'Show More',
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 200.0,
                //color: Colors.tealAccent,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return _BookContainer(
                      book: books[index % 2],
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _BookContainer extends StatelessWidget {
  final Book book;

  const _BookContainer({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
      child: Container(
        width: 150.0,
        //color: Colors.amberAccent,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12.0),
              child: CachedNetworkImage(
                imageUrl: book.coverUrl,
                fit: BoxFit.cover,
                height: 200.0,
                width: double.infinity,
              ),
            ),
            Container(
              height: 200.0,
              width: double.infinity,
              decoration: BoxDecoration(
                // color: Colors.amber,
                gradient: BookGanga.storyGradient,
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            Positioned(
              bottom: 20.0,
              left: 8.0,
              child: Container(
                width: 140.0,
                child: Text(
                  book.title,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SearchBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.fromLTRB(10.0, 6.0, 10.0, 0.0),
      sliver: SliverToBoxAdapter(
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: TextField(
            keyboardType: TextInputType.text,
            textAlign: TextAlign.left,
            onChanged: (value) {},
            decoration: BookGanga.kTextFieldDecoration
                .copyWith(hintText: 'Search your favorite books and authors'),
          ),
        ),
      ),
    );
  }
}
