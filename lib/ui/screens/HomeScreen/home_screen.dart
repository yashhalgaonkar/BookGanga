import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeScreenCubit _homeScreenCubit;
  @override
  void initState() {
    super.initState();
    _homeScreenCubit = BlocProvider.of<HomeScreenCubit>(context);
    _homeScreenCubit.getHomeScreenBlogs('dummy_user_id');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50.0,
        title: Text(
          'BookGanga',
          style: GoogleFonts.pacifico(
            fontSize: 24.0,
            color: BookGanga.kDarkBlack,
          ),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.format_quote_sharp,
          color: BookGanga.kDarkBlack,
          size: 24.0,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.search_rounded),
            onPressed: () {},
            color: BookGanga.kDarkBlack,
          ),
          IconButton(
            icon: Icon(Icons.people),
            onPressed: () {},
            color: BookGanga.kDarkBlack,
          ),
        ],
      ),
      body: SafeArea(
          child: ListView(
        scrollDirection: Axis.vertical,
        physics: BouncingScrollPhysics(),
        children: [
          //* Greeting widget
          Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10.0, 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Hi, Yash',
                    style: GoogleFonts.openSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey),
                  ),
                  Text(
                    'Good Morning!',
                    style: GoogleFonts.openSans(
                        fontSize: 22,
                        fontWeight: FontWeight.w600,
                        color: BookGanga.kDarkBlack),
                  ),
                ],
              )),
          Container(
            child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
              listener: (context, state) {
                if (state is HomeScreenError)
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Error Occured'),
                    action: SnackBarAction(
                      label: 'Retry',
                      onPressed: () {
                        _homeScreenCubit.getHomeScreenBlogs('dummy_user_id');
                      },
                    ),
                  ));
              },
              builder: (context, state) {
                if (state is HomeScreenLoaded)
                  return Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: ScrollPhysics(),
                        itemBuilder: (_, index) {
                          final BlogToDisplay blog = state.blogs[index];
                          if (index == 0)
                            return BlogContainer(blog: blog, paddingTop: true);
                          else
                            return BlogContainer(blog: blog, paddingTop: false);
                        },
                        //separatorBuilder: (_, index) {},
                        itemCount: state.blogs.length),
                  );
                else if (state is HomeScreenLoading)
                  return Center(child: CircularProgressIndicator());
                else
                  return Center(
                      child: Column(
                    children: [
                      Icon(
                        Icons.error_outline,
                        color: Colors.red,
                      ),
                      Text('Error Occured.'),
                    ],
                  ));
              },
            ),
          ),
        ],
      )),
    );
  }
}
