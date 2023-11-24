import 'package:dio/dio.dart';
import 'package:ebook_reader/core/errors/dio_error_handler.dart';
import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:ebook_reader/features/home/domain/use_cases/fetch_books.dart';
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_event.dart';
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class FetchBooksBloc extends Bloc<FetchBooksEvent, FetchBooksState> {
  final FetchBooksUseCase fetchBooksUseCase;
  FetchBooksBloc(this.fetchBooksUseCase) : super(FetchBooksLoading()) {
    on<Fetched>(_onFetched);
    add(Fetched());
  }

  void _onFetched(Fetched event, Emitter<FetchBooksState> emit) async {
    emit(FetchBooksLoading());

    List<BookEntity> books;

    try {
      books = await fetchBooksUseCase.call();
    } catch (e) {
      String message = "$e";

      if (e is DioException) {
        message = DioErrorHandler.handleError(e);
      }

      emit(FetchBooksError(message: message));
      return;
    }

    emit(FetchBooksSuccess(books: books));
  }
}
