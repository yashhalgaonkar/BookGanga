part of 'home_screen_cubit.dart';

@immutable
abstract class HomeScreenState {}

class HomeScreenLoading extends HomeScreenState {}

class HomeScreenLoaded extends HomeScreenState {
  final List<BlogToDisplay> blogs;
  HomeScreenLoaded({this.blogs});
}

class HomeScreenError extends HomeScreenState {
  final String errorMessage;
  HomeScreenError({this.errorMessage});
}
