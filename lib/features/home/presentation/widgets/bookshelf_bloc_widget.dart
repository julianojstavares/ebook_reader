import 'package:ebook_reader/core/service_locator/service_locator.dart';
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_bloc.dart';
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_state.dart';
import 'package:ebook_reader/features/home/presentation/widgets/fetch_books_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bookshelf_grid.dart';

class BookshelfBlocWidget extends StatelessWidget {
  const BookshelfBlocWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBooksBloc, FetchBooksState>(
      bloc: getIt.get<FetchBooksBloc>(),
      builder: (context, state) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 500),
          child: _buildChild(context, state),
        );
      },
    );
  }

  Widget _buildChild(BuildContext context, FetchBooksState state) {
    switch (state) {
      case FetchBooksLoading():
        return const CircularProgressIndicator();

      case FetchBooksError():
        return FetchBooksErrorWidget(message: state.message);

      case FetchBooksSuccess():
        return BookshelfGrid(books: state.books);

      default:
        return const SizedBox();
    }
  }
}
