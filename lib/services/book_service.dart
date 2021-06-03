import 'package:book_ganga/core/strings.dart';
import 'package:book_ganga/models/book.dart';
import 'package:dio/dio.dart';

class BookService {
  Dio _dio = Dio();

  Future<List<Book>> fetchBooks() async {
    List<Book> books = [];
    await getBookOfCategory(category: 'fiction', books: books);
    await getBookOfCategory(category: 'poetry', books: books);
    await getBookOfCategory(category: 'design', books: books);
    await getBookOfCategory(category: 'cooking', books: books);
    await getBookOfCategory(category: 'nature', books: books);
    await getBookOfCategory(category: 'philosophy', books: books);
    await getBookOfCategory(category: 'education', books: books);
    await getBookOfCategory(category: 'comics', books: books);
    await getBookOfCategory(category: 'health', books: books);
    await getBookOfCategory(category: 'business', books: books);
    return books;
  }

  Future<List<List<Book>>> fetchBooksAccordingToCategory() async {
    List<List<Book>> booksList = [];
    List<Book> fictionBooks = [];
    List<Book> poetryBooks = [];
    List<Book> designBooks = [];
    List<Book> cookingBooks = [];
    List<Book> natureBooks = [];
    List<Book> philosophyBooks = [];
    List<Book> educationBooks = [];
    List<Book> comicsBooks = [];
    List<Book> healthBooks = [];
    List<Book> businessBooks = [];
    await getBookOfCategory(category: 'fiction', books: fictionBooks);
    await getBookOfCategory(category: 'poetry', books: poetryBooks);
    await getBookOfCategory(category: 'design', books: designBooks);
    await getBookOfCategory(category: 'cooking', books: cookingBooks);
    await getBookOfCategory(category: 'nature', books: natureBooks);
    await getBookOfCategory(category: 'philosophy', books: philosophyBooks);
    await getBookOfCategory(category: 'education', books: educationBooks);
    await getBookOfCategory(category: 'comics', books: comicsBooks);
    await getBookOfCategory(category: 'health', books: healthBooks);
    await getBookOfCategory(category: 'business', books: businessBooks);
    booksList.addAll([
      fictionBooks,
      poetryBooks,
      designBooks,
      cookingBooks,
      natureBooks,
      philosophyBooks,
      educationBooks,
      cookingBooks,
      healthBooks,
      businessBooks
    ]);
    return booksList;
  }

  Future<Null> getBookOfCategory({String category, List<Book> books}) async {
    Response response = await _dio
        .get('$bookBaseUrl?q=subject:$category&maxResults=39&key=$apiKey');

    if (response.statusCode == 200) {
      response.data['items'].forEach((data) {
        Book book = Book.fromJson(data);
        books.add(book);
      });
    }
  }
}
