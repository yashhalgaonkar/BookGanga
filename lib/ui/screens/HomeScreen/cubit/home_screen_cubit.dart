import 'package:bloc/bloc.dart';
import 'package:book_ganga/models/blog_model.dart';
import 'package:book_ganga/repositories/blog_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  final BlogRepository _blogRepository = GetIt.I<BlogRepository>();
  //final BlogService _blogService = GetIt.I<BlogService>();
  HomeScreenCubit() : super(HomeScreenLoading());

  Future<void> getHomeScreenBlogs(String userId) async {
    try {
      emit(HomeScreenLoading());
      final apiresponse = await _blogRepository.getHomeScreenBlog(userId);
      if (apiresponse.error)
        emit(HomeScreenError(errorMessage: apiresponse.errorMessage));
      else
        emit(HomeScreenLoaded(blogs: apiresponse.data));
    } catch (e) {
      emit(HomeScreenError(errorMessage: e.toString() + 'inside the cubit'));
    }
  }
}
