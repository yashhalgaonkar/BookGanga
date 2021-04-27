import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/newbook_model.dart';
import 'package:book_ganga/models/popularbook_model.dart';
import 'package:book_ganga/ui/screens/HomeScreen/book_profile_screen.dart';
import 'package:book_ganga/ui/widgets/custom_tab_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class DiscoverBooksScreen extends StatefulWidget {
  @override
  _DiscoverBooksScreenState createState() => _DiscoverBooksScreenState();
}

class _DiscoverBooksScreenState extends State<DiscoverBooksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            children: <Widget>[
              Row(
                children: [
                  IconButton(
                      icon: Icon(Icons.arrow_back_ios), onPressed: () {}),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      // Text(
                      //   'Hi, Aditya',
                      //   style: GoogleFonts.openSans(
                      //       fontSize: 14,
                      //       fontWeight: FontWeight.w600,
                      //       color: kGreyColor),
                      // ),
                      Text(
                        'Discover Latest Book',
                        style: GoogleFonts.openSans(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: BookGanga.kDarkBlack),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                height: 39,
                margin: EdgeInsets.only(top: 18),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kLightGreyColor),
                child: Stack(
                  children: <Widget>[
                    TextField(
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      style: GoogleFonts.openSans(
                          fontSize: 12,
                          color: BookGanga.kDarkBlack,
                          fontWeight: FontWeight.w600),
                      decoration: InputDecoration(
                          contentPadding:
                              EdgeInsets.only(left: 19, right: 50, bottom: 8),
                          border: InputBorder.none,
                          hintText: 'Search book..',
                          hintStyle: GoogleFonts.openSans(
                              fontSize: 12,
                              color: kGreyColor,
                              fontWeight: FontWeight.w600)),
                    ),
                    Positioned(
                      right: 0,
                      child:
                          SvgPicture.asset('assets/svg/background_search.svg'),
                    ),
                    Positioned(
                      top: 8,
                      right: 9,
                      child: SvgPicture.asset(
                          'assets/icons/icon_search_white.svg'),
                    )
                  ],
                ),
              ),
              Container(
                height: 25,
                margin: EdgeInsets.only(top: 30),
                child: DefaultTabController(
                  length: 3,
                  child: TabBar(
                      labelPadding: EdgeInsets.all(0),
                      indicatorPadding: EdgeInsets.all(0),
                      isScrollable: true,
                      labelColor: kBlackColor,
                      unselectedLabelColor: kGreyColor,
                      labelStyle: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w700),
                      unselectedLabelStyle: GoogleFonts.openSans(
                          fontSize: 14, fontWeight: FontWeight.w600),
                      indicator: RoundedRectangleTabIndicator(
                          weight: 2, width: 10, color: kBlackColor),
                      tabs: [
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('New'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Trending'),
                          ),
                        ),
                        Tab(
                          child: Container(
                            margin: EdgeInsets.only(right: 23),
                            child: Text('Best Seller'),
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 21),
                height: 210,
                child: ListView.builder(
                    padding: EdgeInsets.only(right: 6),
                    itemCount: newbooks.length,
                    physics: BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(right: 19),
                        height: 210,
                        width: 153,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: kMainColor,
                            image: DecorationImage(
                              image: AssetImage(newbooks[index].image),
                            )),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.only(top: 25),
                child: Text(
                  'Popular',
                  style: GoogleFonts.openSans(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: kBlackColor),
                ),
              ),
              ListView.builder(
                  padding: EdgeInsets.only(top: 25),
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: populars.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        print('ListView Tapped');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BookProfileScreen(
                                popularBookModel: populars[index]),
                          ),
                        );
                      },
                      child: Container(
                        //color: Colors.red,
                        margin: EdgeInsets.only(bottom: 19),
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
                  })
            ],
          ),
        ),
      ),
    );
  }
}
