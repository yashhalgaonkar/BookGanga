import 'models.dart';

class Blog {
  final String title;
  final String description;
  final User author;
  final String headerImageUrl;
  final String timeToRead;
  final int reads;
  final int likes;
  final List<String> tags;
  //final String content;

  const Blog({this.tags, 
      this.title,
      this.description,
      this.author,
      this.headerImageUrl,
      this.timeToRead,
      this.reads,
      this.likes});
}
