import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:flutter/material.dart';

class CoverWidget extends StatelessWidget {
  final int index;
  final BookEntity book;

  const CoverWidget({
    super.key,
    required this.index,
    required this.book,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(book.coverUrl),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(),
                ),
              ),
              Text("$index"),
              Positioned(
                top: -7,
                right: -10,
                child: GestureDetector(
                  onTap: () {},
                  child: const Icon(
                    Icons.bookmark_border,
                    size: 50,
                  ),
                ),
              ),
            ],
          ),
        ),
        Text(
          book.title,
          textAlign: TextAlign.center,
        ),
        Text(
          book.author,
          textAlign: TextAlign.center,
          style: const TextStyle(fontStyle: FontStyle.italic),
        ),
      ],
    );
  }
}
