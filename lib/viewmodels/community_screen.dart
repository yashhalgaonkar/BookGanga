import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/services/services.dart';
import 'package:get_it/get_it.dart';

class CommunityVM {
  final UserService _userService = GetIt.I<UserService>();
  final BookService _bookService = GetIt.I<BookService>();
  Future<List<UserToDisplay>> getChatList(String username) {
    return _userService.getUserSuggetions(username);
  }

  Future<List<Book>> getBooksOfClub(String clubId) {
    return _bookService.fetchBooks();
  }

  Future<List<UserToDisplay>> getMembersOfClub(String clubId) {
    return _userService.getUserSuggetions(clubId);
  }
}
