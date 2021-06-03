import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:book_ganga/core/api_response.dart';
import '../models/user_model.dart';

class UserService {
  static final APIEndpoint =
      'https://my-json-server.typicode.com/yashhalgaonkar/userprofiles/users';

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

  /// Function to get the USer Profile
  Future<UserToDisplay> getUser(String username) {
    return _dio.get(APIEndpoint).then((value) {
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
    return _dio.get(APIEndpoint).then((value) {
      if (value.statusCode == 200) {
        List<UserToDisplay> userSuggetions;
        for (var item in value.data) {
          userSuggetions.add(UserToDisplay.fromJson(item));
        }
        return userSuggetions;
      }
      return [];
    });
  }
}
