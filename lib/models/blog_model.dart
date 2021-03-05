import 'models.dart';

class Blog {
  String title;
  String description;
  User author;
  String titleImageUrl;
  int readCount;
  int shareCount;

  Blog({
    this.title,
    this.description,
    this.author,
    this.titleImageUrl,
    this.readCount,
    this.shareCount
  });
}
