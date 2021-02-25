import 'models.dart';

class Blog {
  String title;
  String description;
  User author;
  String date;
  String imageURL;

  Blog({this.title, this.description, this.date, this.author});
}
