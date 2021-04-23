import 'dart:convert';

import 'package:book_ganga/core/api_response.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:http/http.dart' as http;
import 'package:quick_log/quick_log.dart';

class BlogService {
  static var APIEndpoint = Uri.parse(
      'https://my-json-server.typicode.com/yashhalgaonkar/fake_data/blogs');
  final log = Logger('BlogAPIService');
  // static const headers = {
  //   'apiKey': '724d32be-4988-4264-a371-030b458100e1',
  //   'Content-Type': 'application/json'
  // };

  Future<APIResponse<List<BlogToDisplay>>> getHomeScreenBlogs(String userId) {
    return http.get(APIEndpoint).then((data) {
      if (data.statusCode == 200) {
        log.fine('getHomeScreenBlogs Request successfull.');
        final jsonData = json.decode(data.body);
        final blogs = <BlogToDisplay>[];
        for (var item in jsonData) {
          blogs.add(BlogToDisplay.fromJson(item));
        }

        return APIResponse<List<BlogToDisplay>>(data: blogs);
      }
      return APIResponse<List<BlogToDisplay>>(
          error: true, errorMessage: 'Request failed with response code ${data.statusCode}');
    }).catchError((_) => APIResponse<List<BlogToDisplay>>(
        error: true, errorMessage: 'An error occured'));
  }
}
