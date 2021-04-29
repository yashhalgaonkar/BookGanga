import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/newbook_model.dart';
import 'package:book_ganga/models/popularbook_model.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/book_profile_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:line_icons/line_icons.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class DiscoverBooksScreen extends StatefulWidget {
  @override
  _DiscoverBooksScreenState createState() => _DiscoverBooksScreenState();
}

class _DiscoverBooksScreenState extends State<DiscoverBooksScreen> {
  final List<String> categories = [
    "New",
    "Trending",
    "Bestseller",
    "Romantic",
    "Horror",
    "Biography",
    "Self Help",
  ];
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              //* Title of the Screen
              Row(
                children: [
                  IconButton(
                      padding: EdgeInsets.zero,
                      icon: Icon(Ionicons.arrow_back_circle),
                      onPressed: () {}),
                  Text(
                    'Discover Latest Book',
                    style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: BookGanga.kDarkBlack),
                  ),
                ],
              ),

              //* Input Field
              Container(
                height: 40,
                margin: EdgeInsets.only(top: 15),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: BookGanga.kLightGreyColor),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: BookGanga.kDarkBlack,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          contentPadding: EdgeInsets.only(left: 10, bottom: 10),
                          border: InputBorder.none,
                          hintText: 'Search book..',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              color: kGreyColor,
                              fontWeight: FontWeight.w600)),
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

              //* Tabs
              Container(
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                    labelPadding: EdgeInsets.all(0),
                    indicatorPadding: EdgeInsets.all(0),
                    isScrollable: false,
                    labelColor: kBlackColor,
                    unselectedLabelColor: kGreyColor,
                    labelStyle: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelStyle: GoogleFonts.openSans(
                        fontSize: 14, fontWeight: FontWeight.w600),
                    indicator: MaterialIndicator(
                      color: BookGanga.kAccentColor,
                      tabPosition: TabPosition.bottom,
                      horizontalPadding: 45,
                      paintingStyle: PaintingStyle.fill,
                    ),
                    // indicator: DotIndicator(
                    //   color: BookGanga.kAccentColor,
                    //   radius: 3,
                    //   distanceFromCenter: 16,
                    //   paintingStyle: PaintingStyle.fill,
                    // ),
                    tabs: [
                      Tab(
                        text: 'New',
                      ),
                      Tab(
                        text: 'Trending',
                      ),
                      Tab(
                        text: 'Bestseller',
                      ),
                    ],
                  ),
                ),
              ),

              //*Horizontal ListView
              Container(
                margin: EdgeInsets.only(top: 20),
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

              //* popular Sections
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Popular',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor),
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
  const HorizontalBookTile({
    Key key,
    this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print('ListView Tapped');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                BookProfileScreen(popularBookModel: populars[index]),
          ),
        );
      },
      child: Container(
        //color: Colors.red,
        margin: EdgeInsets.only(bottom: 10),
        height: 81,
        width: MediaQuery.of(context).size.width - 50,
        //color: kBackgroundColor,
        child: Row(
          children: <Widget>[
            Container(
              height: 81,
              width: 62,
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
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Text(
                    populars[index].title,
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    populars[index].author,
                    style: GoogleFonts.openSans(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: kGreyColor),
                  ),
                ),
                Expanded(
                  child: Text(
                    '\$' + populars[index].price,
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
