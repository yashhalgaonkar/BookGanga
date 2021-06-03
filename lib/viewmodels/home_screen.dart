import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/services/blog_service.dart';
import 'package:book_ganga/services/user_service.dart';
import 'package:get_it/get_it.dart';

class HomeScreenVM {
  final UserService _userService = GetIt.I<UserService>();
  final BlogService _blogService = GetIt.I<BlogService>();

  Future<HomeScreenModel> getHomeScreen(String username) async {
    HomeScreenModel homeScreenModel;
    //homeScreenModel.blogs = await _blogService.getHomeScreenBlogs(username);
  }
}
