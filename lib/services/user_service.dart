import 'package:dio/dio.dart';
import '../models/user_model.dart';

class UserService {
  static final apiEndPoint =
      'https://my-json-server.typicode.com/yashhalgaonkar/userprofiles/users';

  Dio _dio = Dio();

  //final log = Logger('UserAPIService');

  /// Function to get the USer Profile
  Future<UserToDisplay> getUser(String username) {
    return _dio.get(apiEndPoint).then((value) {
      if (value.statusCode == 200) {
        // final jsonData = json.decode(value.data);
        for (var item in value.data) {
          UserToDisplay tempUser = UserToDisplay.fromJson(item);
          if (tempUser.username == username) {
            return tempUser;
          }
        }
        //return APIResponse<UserToDisplay>(error: true,errorMessage: 'username not found');
      }
      return null;
    });
  }

  ///Function to get the user suggestions
  Future<List<UserToDisplay>> getUserSuggetions(String username) {
    return _dio.get(apiEndPoint).then((value) {
      if (value.statusCode == 200) {
        final userSuggetions = <UserToDisplay>[];
        for (var item in value.data) {
          userSuggetions.add(UserToDisplay.fromJson(item));
        }
        return userSuggetions;
      }
      return [];
    });
  }
}
