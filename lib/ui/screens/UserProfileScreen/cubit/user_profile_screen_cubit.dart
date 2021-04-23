import 'package:bloc/bloc.dart';
import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/repositories/user_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'user_profile_screen_state.dart';

class UserProfileScreenCubit extends Cubit<UserProfileScreenState> {
  final UserRepository _userRepository = GetIt.I<UserRepository>();
  UserProfileScreenCubit() : super(UserProfileScreenInitial());

  UserToDisplay user;

  Future<void> getUser(String userId) async {
    try {
      emit(UserProfileScreenLoading());
      final response = await _userRepository.getUser(userId);
      if (response.error)
        emit(UserProfileScreenError(response.errorMessage));
      else
        emit(UserProfileScreenLoaded(response.data));
    } catch (e) {
      emit(UserProfileScreenError(e.toString()));
    }
  }
}
