class Book {
  String title;
  String author;
  String imgUrl;
  String desc;
  String category;
  String language;
  int pages;
  Book(
      {this.title,
      this.author,
      this.imgUrl,
      this.desc,
      this.category,
      this.language,
      this.pages});

  factory Book.fromJson(Map<String, dynamic> data) {
    return Book(
      title: data['volumeInfo']['title'],
      imgUrl: data['volumeInfo']['imageLinks'] == null
          ? 'no'
          : data['volumeInfo']['imageLinks']['thumbnail'],
      author: data['volumeInfo']['authors'] == null
          ? 'Anonymous'
          : data['volumeInfo']['authors'][0],
      desc: data['volumeInfo']['description'],
      category: data['volumeInfo']['categories'] == null
          ? ''
          : data['volumeInfo']['categories'][0],
      language: data['volumeInfo']['language'],
      pages: data['volumeInfo']['pageCount'],
    );
  }
}
