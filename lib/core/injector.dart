import 'package:book_ganga/services/services.dart';
import 'package:book_ganga/viewmodels/viewmodels.dart';
import 'package:get_it/get_it.dart';

final instance = GetIt.I;
void initializeDependencies() {
  //* Services
  instance.registerLazySingleton(() => BlogService());
  instance.registerLazySingleton(() => UserService());
  instance.registerLazySingleton(() => BookService());
  instance.registerLazySingleton(() => ActivityService());

  //*View Models
  instance.registerLazySingleton(() => HomeScreenVM());
  instance.registerLazySingleton(() => UserProfileVM());
  instance.registerLazySingleton(() => ActivityScreenVM());
  instance.registerLazySingleton(() => CommunityVM());
}
