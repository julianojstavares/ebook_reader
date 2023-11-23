import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:ebook_reader/features/home/presentation/widgets/show_ebook_bloc_widget.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:flutter/material.dart';

import 'cover_widget.dart';

class BookshelfGrid extends StatelessWidget {
  final List<BookEntity> books;

  const BookshelfGrid({
    super.key,
    required this.books,
  });

  @override
  Widget build(BuildContext context) {
    return ShowEbookBlocWidget(
      child: MasonryGridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        itemCount: books.length,
        itemBuilder: (context, index) => CoverWidget(
          index: index,
          book: books[index],
        ),
      ),
    );
  }
}
