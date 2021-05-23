import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:http/http.dart' as http;
import 'package:book_ganga/core/api_response.dart';
import '../models/user_model.dart';

class UserService {
  static final APIEndpoint =
      'https://my-json-server.typicode.com/yashhalgaonkar/fake_data/user';

  Dio _dio = Dio()
    ..interceptors.add(
      DioCacheInterceptor(
        options: CacheOptions(
          // A default store is required for interceptor.
          store: MemCacheStore(),
          // Default.
          policy: CachePolicy.request,
          // Optional. Returns a cached response on error but for statuses 401 & 403.
          hitCacheOnErrorExcept: [401, 403],
          // Optional. Overrides any HTTP directive to delete entry past this duration.
          maxStale: const Duration(days: 7),
          // Default. Allows 3 cache sets and ease cleanup.
          priority: CachePriority.normal,
          // Default. Body and headers encryption with your own algorithm.
          cipher: null,
          // Default. Key builder to retrieve requests.
          keyBuilder: CacheOptions.defaultCacheKeyBuilder,
          // Default. Allows to cache POST requests.
          // Overriding [keyBuilder] is strongly recommended.
          allowPostMethod: false,
        ),
      ),
    );

  //final log = Logger('UserAPIService');

  Future<APIResponse<UserToDisplay>> getUser(String userId) {
    //log.fine('Called getUser');
    //   return http.get(APIEndpoint).then((data) {
    //     if (data.statusCode == 200) {
    //       //log.fine('getUser reqyest siccessfull');
    //       final jsonData = json.decode(data.body);

    //       final UserToDisplay user = UserToDisplay.fromJson(jsonData);
    //       return APIResponse(data: user);
    //     }
    //     return APIResponse<UserToDisplay>(
    //         error: true,
    //         errorMessage: 'Request failed with response code ${data.statusCode}');
    //   }).catchError((_) => APIResponse<UserToDisplay>(
    //       error: true, errorMessage: 'An error occured'));
    // }

    return _dio.get(APIEndpoint).then((value) {
      if (value.statusCode == 200) {
        print('Statuc code 200');
        // final jsonData = json.decode(value.data);
        final UserToDisplay user = UserToDisplay.fromJson(value.data);
        return APIResponse<UserToDisplay>(data: user);
      }
      return APIResponse<UserToDisplay>(
          error: true,
          errorMessage: 'Request failed with status code ${value.statusCode}' +
              value.statusMessage);
    }).onError((error, stackTrace) => APIResponse<UserToDisplay>(error: true,errorMessage: error.toString()));
  }
}
