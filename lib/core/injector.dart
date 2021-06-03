import 'package:book_ganga/repositories/blog_repository.dart';
import 'package:book_ganga/repositories/user_repository.dart';
import 'package:book_ganga/services/blog_service.dart';
import 'package:book_ganga/services/book_service.dart';
import 'package:book_ganga/services/user_service.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.I;
void initializeDependencies() {
  //* Repositories
  instance.registerLazySingleton(() => BlogRepository());
  instance.registerLazySingleton(() => UserRepository());

  //* Services
  instance.registerLazySingleton(() => BlogService());
  instance.registerLazySingleton(() => UserService());
  instance.registerLazySingleton(() => BookService());
}
