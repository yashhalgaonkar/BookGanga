import 'package:dio/dio.dart';

import '../models/models.dart';

class ActivityService {
  Dio _dio = Dio();
  static const apiEndPoint = 'https://my-json-server.typicode.com/yashhalgaonkar/activity/activities';
  Future<List<ActivityToDisplay>> getActivityOfUser(String username) {
    return _dio.get(apiEndPoint).then((value) {
      if (value.statusCode == 200) {
        List<ActivityToDisplay> activities;
        for (var item in value.data)
          activities.add(ActivityToDisplay.fromJson(item));
        return activities;
      }
      return [];
    });
  }
}
