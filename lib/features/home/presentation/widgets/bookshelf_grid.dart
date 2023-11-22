import 'package:ebook_reader/features/home/domain/entities/book.dart';
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
    return GridView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        mainAxisExtent: 220,
      ),
      itemCount: books.length,
      itemBuilder: (context, index) => CoverWidget(
        index: index,
        book: books[index],
      ),
    );
  }
}
