import 'package:book_ganga/services/blog_service.dart';
import 'package:book_ganga/services/book_service.dart';
import 'package:book_ganga/services/user_service.dart';
import 'package:book_ganga/viewmodels/home_screen.dart';
import 'package:book_ganga/viewmodels/user_profile_screen.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.I;
void initializeDependencies() {
  //* Services
  instance.registerLazySingleton(() => BlogService());
  instance.registerLazySingleton(() => UserService());
  instance.registerLazySingleton(() => BookService());

  //*View Models
  instance.registerLazySingleton(() => HomeScreenVM());
  instance.registerLazySingleton(() => UserProfileVM());

}
