import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:book_ganga/core/api_response.dart';
import '../models/user_model.dart';

class UserService {
  static final APIEndpoint = Uri.parse(
      'https://my-json-server.typicode.com/yashhalgaonkar/fake_data/user');

  //final log = Logger('UserAPIService');

  Future<APIResponse<UserToDisplay>> getUser(String userId) {
    //log.fine('Called getUser');
    return http.get(APIEndpoint).then((data) {
      if (data.statusCode == 200) {
        //log.fine('getUser reqyest siccessfull');
        final jsonData = json.decode(data.body);

        final UserToDisplay user = UserToDisplay.fromJson(jsonData);
        return APIResponse(data: user);
      }
      return APIResponse<UserToDisplay>(
          error: true,
          errorMessage: 'Request failed with response code ${data.statusCode}');
    }).catchError((_) => APIResponse<UserToDisplay>(
        error: true, errorMessage: 'An error occured'));
  }
}
