import 'package:book_ganga/config/book_ganga.dart';
import 'package:book_ganga/data/data.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/ui/screens/HomeScreen/cubit/home_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final homeCubit = BlocProvider.of<HomeScreenCubit>(context);
    homeCubit.getHomeScreenBlogs('dummy_user_id');
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BookGanga',
          style: Theme.of(context)
              .textTheme
              .bodyText2
              .copyWith(color: BookGanga.kDarkBlack, fontSize: 24.0),
        ),
        centerTitle: true,
        leading: Icon(
          Icons.format_quote_sharp,
          color: BookGanga.kDarkBlack,
          size: 24.0,
        ),
        backgroundColor: Colors.white,
        elevation: 2.0,
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
        child: BlocConsumer<HomeScreenCubit, HomeScreenState>(
          listener: (context, state) {
            // TODO: implement listener
            if (state is HomeScreenError)
              print('an error has occured ${state.errorMessage}');
          },
          builder: (context, state) {
            if (state is HomeScreenLoaded)
              return ListView.builder(
                  itemBuilder: (_, index) {
                    final BlogToDisplay blog = state.blogs[index];
                    if (index == 0)
                      return BlogContainer(blog: blog, paddingTop: true);
                    else
                      return BlogContainer(blog: blog, paddingTop: false);
                  },
                  //separatorBuilder: (_, index) {},
                  itemCount: state.blogs.length);
            else
              // state is HomeScreenLoading
              return Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
