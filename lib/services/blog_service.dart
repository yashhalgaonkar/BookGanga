import 'dart:convert';

import 'package:book_ganga/core/api_response.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';
import 'package:http/http.dart' as http;

class BlogService {
  static var APIEndpoint =
      'https://my-json-server.typicode.com/yashhalgaonkar/fake_data/blogs';
  //final log = Logger('BlogAPIService');
  // static const headers = {
  //   'apiKey': '724d32be-4988-4264-a371-030b458100e1',
  //   'Content-Type': 'application/json'
  // };

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

  Future<APIResponse<List<BlogToDisplay>>> getHomeScreenBlogs(String userId) {
    // return http.get(APIEndpoint).then((data) {
    //   if (data.statusCode == 200) {
    //     //log.fine('getHomeScreenBlogs Request successfull.');
    //     final jsonData = json.decode(data.body);
    //     final blogs = <BlogToDisplay>[];
    //     for (var item in jsonData) {
    //       blogs.add(BlogToDisplay.fromJson(item));
    //     }

    //     return APIResponse<List<BlogToDisplay>>(data: blogs);
    //   }
    //   return APIResponse<List<BlogToDisplay>>(
    //       error: true,
    //       errorMessage: 'Request failed with response code ${data.statusCode}');
    // }).catchError((_) => APIResponse<List<BlogToDisplay>>(
    //     error: true, errorMessage: 'An error occured'));

    return _dio.get(APIEndpoint).then((value) {
      if (value.statusCode == 200) {
        print('UserService: Status Code 200');
        final blogs = <BlogToDisplay>[];
        for (var item in value.data) blogs.add(BlogToDisplay.fromJson(item));

        return APIResponse<List<BlogToDisplay>>(data: blogs);
      }
      return APIResponse<List<BlogToDisplay>>(
          error: true,
          errorMessage: 'Request failed with status code ${value.statusCode}');
    }).catchError((_) => APIResponse<List<BlogToDisplay>>(
        error: true, errorMessage: 'An error occured'));
  }
}
