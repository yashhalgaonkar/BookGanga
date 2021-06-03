import 'package:book_ganga/models/blog_to_display.dart';
import 'package:dio/dio.dart';
import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

class BlogService {
  static var apiEndPoint =
      'https://my-json-server.typicode.com/yashhalgaonkar/homescreen/blogs';

  //final log = Logger('BlogAPIService');
  // static const headers = {
  //   'apiKey': '724d32be-4988-4264-a371-030b458100e1',
  //   'Content-Type': 'application/json'
  // };

  Dio _dio = Dio();

  Future<List<BlogToDisplay>> getHomeScreenBlogs(String userId) {
    return _dio.get(apiEndPoint).then((value) {
      if (value.statusCode == 200) {
        final blogs = <BlogToDisplay>[];
        for (var item in value.data) blogs.add(BlogToDisplay.fromJson(item));

        return blogs;
      }
      return [];
    });
  }
}
