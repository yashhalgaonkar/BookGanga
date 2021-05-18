import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/newbook_model.dart';
import 'package:book_ganga/models/popularbook_model.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/book_profile_screen.dart';
import 'package:book_ganga/ui/screens/HomeScreen/home_screen.dart';
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
  int selectedCategory = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        excludeHeaderSemantics: false,
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Text(
          'Discover Latest Book',
          style: GoogleFonts.openSans(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: BookGanga.kDarkBlack),
        ),
        // bottom: PreferredSize(
        //   preferredSize: Size(double.infinity, 30),
        //   child: Container(
        //       alignment: Alignment.center,
        //       width: double.infinity,
        //       child: Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           Icon(Ionicons.location_outline),
        //           Text('Beed, Maharashtra'),
        //         ],
        //       )),
        // ),
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
                padding: EdgeInsets.only(top: 20),
                child: Text(
                  'Available',
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
  HorizontalBookTile({
    Key key,
    this.index,
  }) : super(key: key);

  final prominent = GoogleFonts.openSans(
      fontSize: 12, fontWeight: FontWeight.w600, color: kBlackColor);
  final grey = GoogleFonts.openSans(
      fontSize: 12, fontWeight: FontWeight.w400, color: kGreyColor);

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
        height: 80,
        //width: MediaQuery.of(context).size.width - 50,
        //color: kBackgroundColor,
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
                    'The Alchemist',
                    style: GoogleFonts.openSans(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: kBlackColor),
                  ),
                  Text(
                    'Paulo Colheo',
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
