import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/cubit/discoverbooks_cubit.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/widgets/new_book_builder.dart';
import 'package:book_ganga/ui/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DiscoverBooksScreen extends StatefulWidget {
  @override
  _DiscoverBooksScreenState createState() => _DiscoverBooksScreenState();
}

class _DiscoverBooksScreenState extends State<DiscoverBooksScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DiscoverbooksCubit _discoverbooksCubit;

  @override
  void initState() {
    super.initState();
    _discoverbooksCubit = BlocProvider.of<DiscoverbooksCubit>(context);
    _discoverbooksCubit.fetchBooks('dummy_user_id');
  }

  Container buildCategories(TextStyle style) {
    return Container(
      //margin: EdgeInsets.only(top: 600),
      //height: 300,
      width: double.maxFinite,

      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Text(
            'Categories',
            style: style.copyWith(fontSize: 30, color: Colors.black),
          ),
          SizedBox(
            height: 10,
          ),
          LimitedBox(
            maxHeight: 100,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: <Widget>[
                categoryChild(style: style, title: 'Fiction', category: 0),
                categoryChild(style: style, title: 'Poetry', category: 1),
                categoryChild(style: style, title: 'Design', category: 2),
                categoryChild(style: style, title: 'Cooking', category: 3),
                categoryChild(style: style, title: 'Nature', category: 4),
                categoryChild(style: style, title: 'Philosophy', category: 5),
                categoryChild(style: style, title: 'Education', category: 6),
                categoryChild(style: style, title: 'Comics', category: 7),
                categoryChild(style: style, title: 'Health', category: 8),
                categoryChild(style: style, title: 'Business', category: 9),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget categoryChild({TextStyle style, String title, int category}) {
    return GestureDetector(
      // onTap: () => Navigator.pushNamed(context, PageRouter.seeAllBooksPage,
      //     arguments: category),
      child: Container(
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(10),
        //width: 120,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.black12,
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(0, 4))
            ]),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // SvgPicture.asset(
            //   'assets/books/categories/${title.toLowerCase()}.svg',
            //   height: 30,
            //   width: 30,
            // ),
            // SizedBox(
            //   height: 10,
            // ),
            Text(
              title,
              style: style.copyWith(color: Colors.black, fontSize: 20),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              '45 books',
              style: style.copyWith(color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var style = Theme.of(context).textTheme.bodyText1;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text('Discover Books', style: BookGanga.titleStyle),
        centerTitle: true,
      ),
      body: SafeArea(
        child: BlocConsumer<DiscoverbooksCubit, DiscoverbooksState>(
          listener: (context, state) {},
          builder: (context, state) {
            if (state is DiscoverbooksInitial || state is DiscoverBooksLoading)
              return LoadingWidget();
            else if (state is DiscoverBooksLoaded)
              return SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
                      child: MyInputField(),
                    ),
                    //buildCategories(Theme.of(context).textTheme.bodyText1),
                    NewBooksBuilder(
                      sectionTitle: 'Recommended for you',
                      sectionSubtitle:
                          'Hunt new books before other bookworms do it!',
                      alignLeft: true,
                      books: state.discoverNew,
                      scaffoldKey: _scaffoldKey,
                    ),
                    NewBooksBuilder(
                      sectionTitle: 'Near You',
                      sectionSubtitle: 'Find books that are near you!',
                      alignLeft: false,
                      books: state.discoverNew,
                      scaffoldKey: _scaffoldKey,
                    ),
                    NewBooksBuilder(
                      sectionTitle: 'In the Book Club',
                      sectionSubtitle:
                          'Books that are available in clubs you have joined',
                      alignLeft: true,
                      books: state.discoverNew,
                      scaffoldKey: _scaffoldKey,
                    ),
                  ],
                ),
              );
            else
              return MyErrorWidget(
                  onRefresh: () =>
                      _discoverbooksCubit.fetchBooks('dummy_user_id'),
                  errorMessage: (state as DiscoverBooksError).errorMessage);
          },
        ),
      ),
    );
  }
}
