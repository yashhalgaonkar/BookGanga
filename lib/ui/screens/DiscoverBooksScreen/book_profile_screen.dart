import 'dart:math';
import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/config/color_constant.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/ui/widgets/loading_widget.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

import 'widgets/book_profile_bottom_buttons.dart';
import 'widgets/book_profile_tabbar_view.dart';

class BookProfileScreen extends StatefulWidget {
  final Book book;
  final List<Book> bookList;
  final int index;
  final bool fromLibrary;
  BookProfileScreen(
      {@required this.book,
      this.fromLibrary = false,
      this.bookList,
      this.index});

  @override
  _BookProfileScreenState createState() => _BookProfileScreenState();
}

class _BookProfileScreenState extends State<BookProfileScreen>
    with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  TabController _tabController;
  AnimationController _animationController;
  PageController _pageController;
  @override
  void initState() {
    _pageController = PageController(initialPage: widget.index);
    _tabController = TabController(length: 3, vsync: this);
    _animationController = AnimationController(
        vsync: this,
        lowerBound: 0.09,
        upperBound: 0.1,
        duration: Duration(milliseconds: 600))
      ..forward();
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    _animationController.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
              icon: Icon(
                Icons.close,
                size: 20,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context)),
        ),
        body: PageView.builder(
          controller: _pageController,
          itemCount: widget.bookList.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            return Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[buildBookHolder(index), buildBookCover(index)],
            );
          },
        ),
      ),
    );
  }

  Widget buildBookHolder(int index) {
    return Container(
      height: double.maxFinite,
      margin: EdgeInsets.only(top: 70, left: 20, right: 20),
      width: double.maxFinite,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30), topRight: Radius.circular(30)),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black12, spreadRadius: 10, blurRadius: 20)
          ]),
      child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //* Category
            Container(
              margin: EdgeInsets.only(bottom: 15),
              color: BookGanga.kAccentColor,
              height: 24,
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
              child: Text(
                widget.book.category,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(color: Colors.white),
              ),
            ),
            //* Book Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                widget.bookList[index].title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),

            SizedBox(
              height: 5,
            ),
            //* Author
            Text(
              widget.bookList[index].author,
              style: Theme.of(context)
                  .textTheme
                  .bodyText2
                  .copyWith(fontSize: 14.0),
            ),

            SizedBox(
              height: 5,
            ),
            Divider(
              color: Colors.black12,
              indent: 50,
              endIndent: 50,
              thickness: 1,
            ),
            SizedBox(
              height: 5,
            ),
            buildTabBar(),
            BookPageTabBarView(
              index: index,
              bookList: widget.bookList,
              tabController: _tabController,
            ),
            BookPageBottomButtons(
              fromLibrary: widget.fromLibrary,
              bookList: widget.bookList,
              scaffoldKey: _scaffoldKey,
              index: index,
            )
          ],
        ),
      ),
    );
  }

  Positioned buildBookCover(int index) {
    return Positioned(
      top: -2,
      child: AnimatedBuilder(
        builder: (BuildContext context, Widget child) {
          return Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.0006)
              ..rotateY(pi / _animationController.value),
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 200,
              width: 150,
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.black12,
                    spreadRadius: 1,
                    blurRadius: 20,
                    offset: Offset(0, 200 * _animationController.value))
              ]),
              child: CachedNetworkImage(
                imageUrl: widget.bookList[index].imgUrl,
                placeholder: (context, string) => LoadingWidget(),
                height: 200.0,
                width: 150.0,
              ),
            ),
          );
        },
        animation: CurvedAnimation(
            parent: _animationController, curve: Curves.easeOut),
      ),
    );
  }

  TabBar buildTabBar() {
    // return TabBar(
    //   controller: _tabController,
    //   labelColor: BookGanga.kAccentColor,
    //   indicatorColor: BookGanga.kAccentColor,
    //   indicatorSize: TabBarIndicatorSize.label,
    //   indicatorWeight: 4,
    //   labelPadding: EdgeInsets.only(bottom: 5),
    //   indicatorPadding: EdgeInsets.symmetric(horizontal: 15),
    //   tabs: [
    //     Text(
    //       'About Book',
    //       style: style.copyWith(color: Colors.black),
    //     ),
    //     Text(
    //       'Owner\'s Info',
    //       style: style.copyWith(color: Colors.black),
    //     ),
    //   ],
    // );

    return TabBar(
        controller: _tabController,
        labelPadding: EdgeInsets.all(0),
        indicatorPadding: EdgeInsets.all(0),
        isScrollable: false,
        labelColor: kBlackColor,
        unselectedLabelColor: kGreyColor,
        // labelStyle:
        //     GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w700),
        labelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 14.0, fontWeight: FontWeight.w700),
        // unselectedLabelStyle:
        //     GoogleFonts.openSans(fontSize: 14, fontWeight: FontWeight.w600),
        unselectedLabelStyle: Theme.of(context)
            .textTheme
            .bodyText1
            .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
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
            text: 'About Book',
          ),
          Tab(
            text: 'Reviews',
          ),
          Tab(
            text: 'Available',
          ),
        ]);
  }
}
