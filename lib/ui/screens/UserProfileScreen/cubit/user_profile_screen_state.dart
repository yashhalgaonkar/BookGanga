part of 'user_profile_screen_cubit.dart';

@immutable
abstract class UserProfileScreenState {}

class UserProfileScreenInitial extends UserProfileScreenState {}

class UserProfileScreenLoading extends UserProfileScreenState {}

class UserProfileScreenLoaded extends UserProfileScreenState {
  final UserToDisplay user;
  UserProfileScreenLoaded(this.user);
}

class UserProfileScreenError extends UserProfileScreenState {
  final String errorMessage;
  UserProfileScreenError(this.errorMessage);
}
