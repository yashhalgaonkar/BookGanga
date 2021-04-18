import 'package:book_ganga/core/api_response.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:book_ganga/services/blog_service.dart';
import 'package:get_it/get_it.dart';

class BlogRepository {
  final BlogService _blogService = GetIt.I<BlogService>();
  Future<APIResponse<List<BlogToDisplay>>> getHomeScreenBlog(String userId) {
    return _blogService.getHomeScreenBlogs(userId);
  }
}
