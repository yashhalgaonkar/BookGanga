import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/services/blog_service.dart';
import 'package:book_ganga/services/book_service.dart';
import 'package:book_ganga/services/user_service.dart';
import 'package:get_it/get_it.dart';

class UserProfileVM {
  final BlogService _blogService = GetIt.I<BlogService>();
  final UserService _userService = GetIt.I<UserService>();
  final BookService _bookService = GetIt.I<BookService>();

  Future<UserToDisplay> getUserProfile(String username) async {
    UserToDisplay user = await _userService.getUser(username);
    final blogs = await _blogService.getHomeScreenBlogs(username);
    user.blogs = blogs;
    user.sharedBlogs = blogs;
    user.reviews = blogs;

    print('Lenght of blogs: ${blogs.length}');
    return user;
  }

  Future<List<UserToDisplay>> getFollowerForUser(String username) {
    return  _userService.getUserSuggetions(username);
  }

  Future<List<Book>> getBookSelfForUser(String username) async {
    return _bookService.fetchBooks();
  }
}
