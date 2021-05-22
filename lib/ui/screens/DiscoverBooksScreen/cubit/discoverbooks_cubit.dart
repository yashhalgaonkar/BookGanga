import 'package:bloc/bloc.dart';
import 'package:book_ganga/models/book.dart';
import 'package:meta/meta.dart';

part 'discoverbooks_state.dart';

class DiscoverbooksCubit extends Cubit<DiscoverbooksState> {
  DiscoverbooksCubit() : super(DiscoverbooksInitial());
  
  Future<void> fetchBooks()
  {
    try{
      emit(DiscoverBooksLoading());


    }catch(e)
    {
      
    }

  }


}
