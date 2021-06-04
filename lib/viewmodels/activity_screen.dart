import 'package:book_ganga/models/models.dart';
import 'package:book_ganga/services/activity_service.dart';
import 'package:get_it/get_it.dart';

class ActivityScreenVM {
  final ActivityService _activityService = GetIt.I<ActivityService>();
  Future<List<ActivityToDisplay>> getActivityOfUser(String username) {
    return _activityService.getActivityOfUser(username);
  }
}
