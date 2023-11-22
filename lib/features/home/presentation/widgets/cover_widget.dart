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
    return Container(
      color: Colors.red,
      height: 280,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(book.coverUrl),
                    fit: BoxFit.fill,
                  ),
                  border: Border.all(),
                ),
              ),
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
          Text(
            book.title,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 4,
          ),
          Text(
            book.author,
            textAlign: TextAlign.center,
            style: const TextStyle(fontStyle: FontStyle.italic),
            overflow: TextOverflow.ellipsis,
            maxLines: 3,
          ),
        ],
      ),
    );
  }
}
