import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/cubit/discoverbooks_cubit.dart';
import 'package:book_ganga/ui/screens/DiscoverBooksScreen/widgets/new_book_builder.dart';
import 'package:book_ganga/ui/widgets/error_widget.dart';
import 'package:book_ganga/ui/widgets/loading_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:line_icons/line_icons.dart';
import 'package:focused_menu/focused_menu.dart';
import 'package:focused_menu/modals.dart';

class DiscoverBooksScreen extends StatefulWidget {
  @override
  _DiscoverBooksScreenState createState() => _DiscoverBooksScreenState();
}

class _DiscoverBooksScreenState extends State<DiscoverBooksScreen> {
  Future<List<Book>> _future;
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  DiscoverbooksCubit _discoverbooksCubit;

  @override
  void initState() {
    super.initState();
    _discoverbooksCubit = BlocProvider.of<DiscoverbooksCubit>(context);
    _discoverbooksCubit.fetchBooks('dummy_user_id');
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

class MyInputField extends StatelessWidget {
  const MyInputField({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: BookGanga.kLightGreyColor),
      child: Stack(
        children: <Widget>[
          TextField(
            autofocus: false,
            cursorColor: BookGanga.kAccentColor,
            enabled: true,
            enableSuggestions: true,
            keyboardType: TextInputType.text,
            maxLengthEnforcement: MaxLengthEnforcement.enforced,
            style: Theme.of(context)
                .textTheme
                .bodyText1
                .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 10, bottom: 5),
              border: InputBorder.none,
              hintText: 'Search book..',
              hintStyle: Theme.of(context).textTheme.bodyText1.copyWith(
                    fontSize: 14.0,
                    fontWeight: FontWeight.w600,
                    color: BookGanga.kGrey,
                  ),
            ),
          ),
          Positioned(
              right: 0,
              child: Container(
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: BookGanga.kAccentColor.withOpacity(0.8),
                ),
                child: Icon(LineIcons.search, color: Colors.white),
                alignment: Alignment.center,
              )),
        ],
      ),
    );
  }
}
