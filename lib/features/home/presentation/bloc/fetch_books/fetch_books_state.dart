import 'package:ebook_reader/features/home/domain/entities/book.dart';

abstract class FetchBooksState {}

class FetchBooksLoading extends FetchBooksState {}

class FetchBooksError extends FetchBooksState {
  final String message;

  FetchBooksError({required this.message});
}

class FetchBooksSuccess extends FetchBooksState {
  final List<BookEntity> books;

  FetchBooksSuccess({required this.books});
}
