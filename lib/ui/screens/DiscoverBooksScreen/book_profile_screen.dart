import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/newbook_model.dart';
import 'package:book_ganga/models/popularbook_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class BookProfileScreen extends StatelessWidget {
  final PopularBookModel book;

  BookProfileScreen({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   bottomNavigationBar: Container(
    //     margin: EdgeInsets.only(left: 25, right: 25, bottom: 25),
    //     height: 49,
    //     color: Colors.transparent,
    //     child: FlatButton(
    //       color: kMainColor,
    //       onPressed: () {},
    //       child: Text(
    //         'Add to Library',
    //         style: GoogleFonts.openSans(
    //             fontSize: 14, fontWeight: FontWeight.w600, color: kWhiteColor),
    //       ),
    //       shape:
    //           RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    //     ),
    //   ),
    //   body: SafeArea(
    //     child: Container(
    //       child: CustomScrollView(
    //         slivers: <Widget>[
    //           SliverAppBar(
    //             backgroundColor: kMainColor,
    //             expandedHeight: MediaQuery.of(context).size.height * 0.5,
    //             flexibleSpace: Container(
    //               color: Color(popularBookModel.color),
    //               height: MediaQuery.of(context).size.height * 0.5,
    //               child: Stack(
    //                 children: <Widget>[
    //                   Positioned(
    //                     left: 25,
    //                     top: 35,
    //                     child: GestureDetector(
    //                       onTap: () {
    //                         Navigator.pushReplacementNamed(
    //                             context, "/homeScreen");
    //                       },
    //                       child: Container(
    //                         width: 32,
    //                         height: 32,
    //                         decoration: BoxDecoration(
    //                             borderRadius: BorderRadius.circular(5),
    //                             color: kWhiteColor),
    //                             //TODO: REfactor
    //                         // child: SvgPicture.asset(
    //                         //     'assets/icons/icon_back_arrow.svg'),
    //                       ),
    //                     ),
    //                   ),
    //                   Align(
    //                     alignment: Alignment.bottomCenter,
    //                     child: Container(
    //                       margin: EdgeInsets.only(bottom: 62),
    //                       width: 172,
    //                       height: 225,
    //                       decoration: BoxDecoration(
    //                         borderRadius: BorderRadius.circular(10),
    //                         image: DecorationImage(
    //                           image: AssetImage(popularBookModel.image),
    //                         ),
    //                       ),
    //                     ),
    //                   )
    //                 ],
    //               ),
    //             ),
    //           ),
    //           SliverList(
    //               delegate: SliverChildListDelegate([
    //             Padding(
    //               padding: EdgeInsets.only(top: 24, left: 25),
    //               child: Text(
    //                 popularBookModel.title,
    //                 style: GoogleFonts.openSans(
    //                     fontSize: 27,
    //                     color: kBlackColor,
    //                     fontWeight: FontWeight.w600),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(top: 7, left: 25),
    //               child: Text(
    //                 popularBookModel.author,
    //                 style: GoogleFonts.openSans(
    //                     fontSize: 14,
    //                     color: kGreyColor,
    //                     fontWeight: FontWeight.w400),
    //               ),
    //             ),
    //             Padding(
    //                 padding: EdgeInsets.only(top: 7, left: 25),
    //                 child: Row(
    //                   crossAxisAlignment: CrossAxisAlignment.start,
    //                   children: <Widget>[
    //                     Text(
    //                       '\$',
    //                       style: GoogleFonts.openSans(
    //                           fontSize: 14,
    //                           color: kMainColor,
    //                           fontWeight: FontWeight.w600),
    //                     ),
    //                     Text(
    //                       popularBookModel.price,
    //                       style: GoogleFonts.openSans(
    //                           fontSize: 32,
    //                           color: kMainColor,
    //                           fontWeight: FontWeight.w600),
    //                     ),
    //                   ],
    //                 )),
    //             Container(
    //               height: 28,
    //               margin: EdgeInsets.only(top: 23, bottom: 36),
    //               padding: EdgeInsets.only(left: 25),
    //               child: DefaultTabController(
    //                 length: 3,
    //                 child: TabBar(
    //                     labelPadding: EdgeInsets.all(0),
    //                     indicatorPadding: EdgeInsets.all(0),
    //                     isScrollable: true,
    //                     labelColor: kBlackColor,
    //                     unselectedLabelColor: kGreyColor,
    //                     labelStyle: GoogleFonts.openSans(
    //                         fontSize: 14, fontWeight: FontWeight.w700),
    //                     unselectedLabelStyle: GoogleFonts.openSans(
    //                         fontSize: 14, fontWeight: FontWeight.w600),
    //                     indicator: DotIndicator(
    //                       color: BookGanga.kAccentColor,
    //                       radius: 3,
    //                       distanceFromCenter: 15,
    //                       paintingStyle: PaintingStyle.fill,

    //                     ),
    //                     tabs: [
    //                       Tab(
    //                         child: Container(
    //                           margin: EdgeInsets.only(right: 39),
    //                           child: Text('Description'),
    //                         ),
    //                       ),
    //                       Tab(
    //                         child: Container(
    //                           margin: EdgeInsets.only(right: 39),
    //                           child: Text('Reviews'),
    //                         ),
    //                       ),
    //                       Tab(
    //                         child: Container(
    //                           margin: EdgeInsets.only(right: 39),
    //                           child: Text('Similar'),
    //                         ),
    //                       )
    //                     ]),
    //               ),
    //             ),
    //             Padding(
    //               padding: EdgeInsets.only(left: 25, right: 25, bottom: 25),
    //               child: Text(
    //                 popularBookModel.description,
    //                 style: GoogleFonts.openSans(
    //                   fontSize: 12,
    //                   fontWeight: FontWeight.w400,
    //                   color: kGreyColor,
    //                   letterSpacing: 1.5,
    //                   height: 2,
    //                 ),
    //               ),
    //             )
    //           ]))
    //         ],
    //       ),
    //     ),
    //   ),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
          child: DefaultTabController(
        length: 3,
        child: NestedScrollView(
          headerSliverBuilder: (context, _) {
            return [
              SliverToBoxAdapter(child: _Header()),
            ];
          },
          body: Column(
            children: [
              //const SizedBox(height: 6.0),
              _TabBarContainer(book: book),
              Expanded(
                child: TabBarView(
                  children: [
                    //_BlogListWidget(),
                    //_ReviewsListWidget(),
                    //_BlogListWidget(),
                    //_ShareListWidget(),

                    Container(
                      child: Text('Review'),
                    ),
                    Container(
                      child: Text('Availablity'),
                    ),
                    Container(
                      child: Text('Description'),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}

class _Header extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 10.0),
      //color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: CachedNetworkImage(
              imageUrl:
                  'https://upload.wikimedia.org/wikipedia/en/9/99/Catch22.jpg',
              width: 225,
              height: 300,
              fit: BoxFit.fill,
            ),
          ),
          Text(
            'Harry Potter and Prizoner Of Azkaban',
            style: Theme.of(context).textTheme.bodyText1.copyWith(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                ),
          ),
          Text('Novel by Josheph Heller'),
        ],
      ),
    );
  }
}

///widget for the tabs - Blog, Reviews, Shares
class _TabBarContainer extends StatelessWidget {
  final PopularBookModel book;
  const _TabBarContainer({Key key, @required this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //color: Colors.red,
      width: double.infinity,
      //padding: const EdgeInsets.only(horizontal: 10.0),
      //padding: const EdgeInsets.fromLTRB(6.0, 2.0, 6.0, 0.0),
      child: TabBar(
          labelPadding: EdgeInsets.all(0),
          indicatorPadding: EdgeInsets.all(0),
          isScrollable: false,
          labelColor: kBlackColor,
          unselectedLabelColor: kGreyColor,
          labelStyle:
              GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700),
          unselectedLabelStyle:
              GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600),
          indicator: MaterialIndicator(
            color: BookGanga.kAccentColor,
            tabPosition: TabPosition.bottom,
            horizontalPadding: 50,
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
              text: 'Reviews',
            ),
            Tab(
              text: 'Availablity',
            ),
            Tab(
              text: 'Description',
            ),
          ]),
    );
  }
}
