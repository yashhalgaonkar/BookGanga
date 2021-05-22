part of 'discoverbooks_cubit.dart';

@immutable
abstract class DiscoverbooksState {}

class DiscoverbooksInitial extends DiscoverbooksState {}

class DiscoverBooksLoading extends DiscoverbooksState {}

class DiscoverBooksLoaded extends DiscoverbooksState {
  final List<Book> discoverNew;
  final List<Book> inYourNeighbourhood;
  final List<Book> inYourBookClub;

  DiscoverBooksLoaded({
    this.discoverNew,
    this.inYourBookClub,
    this.inYourNeighbourhood,
  });
}

class DiscoverBooksError extends DiscoverbooksState {
  final String errorMessage;
  DiscoverBooksError({this.errorMessage});
}
