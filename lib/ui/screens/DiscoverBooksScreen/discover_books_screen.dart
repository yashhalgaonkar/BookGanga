import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/newbook_model.dart';
import 'package:book_ganga/models/popularbook_model.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/book_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';

class DiscoverBooksScreen extends StatefulWidget {
  @override
  _DiscoverBooksScreenState createState() => _DiscoverBooksScreenState();
}

class _DiscoverBooksScreenState extends State<DiscoverBooksScreen> {
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0.0,
        title: Text(
          'Discover Latest Book',
          style: GoogleFonts.sacramento(
            fontSize: 28.0,
            color: BookGanga.kDarkBlack,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              //* Title of the Screen

              //* Input Field
              Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: BookGanga.kLightGreyColor),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: Theme.of(context).textTheme.bodyText1.copyWith(
                          fontSize: 12.0, fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                        border: InputBorder.none,
                        hintText: 'Search book..',
                        hintStyle:
                            Theme.of(context).textTheme.bodyText1.copyWith(
                                  fontSize: 12.0,
                                  fontWeight: FontWeight.w600,
                                  color: BookGanga.kGrey,
                                ),
                      ),
                    ),
                    Positioned(
                        right: 0,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: BookGanga.kAccentColor.withOpacity(0.8),
                          ),
                        )),
                    Positioned(
                      top: 8,
                      right: 9,
                      // child: SvgPicture.asset(
                      //     'assets/icons/icon_search_white.svg'),
                      child: Icon(LineIcons.search, color: Colors.white),
                    )
                  ],
                ),
              ),

              //* Title: Popular
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Popular',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ),
              //*Horizontal ListView
              Container(
                margin: EdgeInsets.only(top: 10),
                height: 210,
                child: ListView.builder(
                    padding: EdgeInsets.only(right: 6),
                    itemCount: newbooks.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 10),
                        height: 210,
                        width: 153,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kMainColor,
                            //TODO: Change to CachedNetworkImage
                            image: DecorationImage(
                              image: AssetImage(newbooks[index].image),
                            )),
                      );
                    }),
              ),

              //* available Sections
              Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  'Available',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1
                      .copyWith(fontSize: 20.0, fontWeight: FontWeight.w600),
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 10.0),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    //TODO: pass the object directly after API calls are made
                    return HorizontalBookTile(index: index % populars.length);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

class HorizontalBookTile extends StatelessWidget {
  final int index;
  HorizontalBookTile({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prominent = Theme.of(context).textTheme.bodyText1;
    final grey = Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 12.0);
    return GestureDetector(
      onTap: () {
        print('ListView Tapped');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BookProfileScreen(book: populars[index]),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 10),
        height: 80,
        child: Row(
          children: <Widget>[
            Container(
              height: 80,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: DecorationImage(
                    //TODO: Make it CachedNetworkImage
                    image: AssetImage(populars[index].image),
                  ),
                  color: kMainColor),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Catch 22',
                    style: Theme.of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'John Wright',
                    style: prominent,
                  ),
                  Text(
                    'Available with Aditya Giradkar from BookGanga Community',
                    softWrap: true,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: grey,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
