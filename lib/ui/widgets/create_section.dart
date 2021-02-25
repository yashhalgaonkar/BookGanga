import 'package:flutter/material.dart';
import '../../models/models.dart';

class CreateSection extends StatelessWidget {
  final String title;
  final List<Blog> blogList;

  CreateSection({
    this.title,
    this.blogList,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.yellow,
      padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //* Title text
          Text(
            title,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 20.0,
            ),
          ),
          Container(
            height: 2.0,
            color: Colors.black,
            width: 55.0,
          ),
          //List View Container
          Container(
            //color: Colors.red,
            margin: const EdgeInsets.only(top: 5.0),
            //* height of the list view
            height: 215.0,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return VerticalBlogTile(index: index);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class VerticalBlogTile extends StatelessWidget {
  final int index;

  const VerticalBlogTile({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: (index != 0)
          ? const EdgeInsets.all(3.0)
          : const EdgeInsets.fromLTRB(0.0, 3.0, 3.0, 3.0),
      decoration: BoxDecoration(
        //color: Colors.green,
        borderRadius: BorderRadius.circular(6.0),
        //border: Border.all(color: Colors.grey.shade400, width: 1.0),
      ),

      //*width of the container
      width: 125.0,

      margin: (index == 0)
          ? const EdgeInsets.only(right: 2.0)
          : const EdgeInsets.symmetric(horizontal: 2.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6.0),
            child: Image.asset(
              'assets/images/dp2.png',
              //* Dimension of the image
              height: 135.0,
              width: 125.0,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            'A VIT Boy hacks GitHub and deletes all JS repos.',
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            'by Yash Halgaonkar',
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );
  }
}
