import 'package:bloc/bloc.dart';
import 'package:book_ganga/models/book.dart';
import 'package:book_ganga/services/book_service.dart';
import 'package:get_it/get_it.dart';
import 'package:meta/meta.dart';

part 'discoverbooks_state.dart';

class DiscoverbooksCubit extends Cubit<DiscoverbooksState> {
  DiscoverbooksCubit() : super(DiscoverbooksInitial());
  // replace this with the repository
  final BookService _bookService = GetIt.I<BookService>();

  void fetchBooks(String userId) async {
    try {
      emit(DiscoverBooksLoading());
      _bookService.fetchBooks().then((books) {
        emit(DiscoverBooksLoaded(
            discoverNew: books,
            inYourBookClub: books,
            inYourNeighbourhood: books));
      }).onError((error, stackTrace) {
        emit(DiscoverBooksError(errorMessage: error.toString() + ' in cubit'));
      });
    } catch (e) {
      emit(DiscoverBooksError(errorMessage: e.toString() + ' in cubit 2'));
    }
  }
}
