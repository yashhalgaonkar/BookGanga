import 'package:book_ganga/core/api_response.dart';
import 'package:book_ganga/services/user_service.dart';
import '../models/user_model.dart';
import 'package:get_it/get_it.dart';

class UserRepository{
  final UserService _userService = GetIt.I<UserService>();

  Future<APIResponse<UserToDisplay>> getUser(String userId)
  {
    return _userService.getUser(userId);
  }
}