import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class FavoriteToggle extends StatefulWidget {
  final BookEntity book;

  const FavoriteToggle({
    super.key,
    required this.book,
  });

  @override
  State<FavoriteToggle> createState() => _FavoriteToggleState();
}

class _FavoriteToggleState extends State<FavoriteToggle> {
  bool favorite = false;
  final favoritesBox = Hive.box<BookEntity>('favoritesBox');

  @override
  Widget build(BuildContext context) {
    final book = widget.book;

    return Visibility(
      visible: !favorite,
      replacement: GestureDetector(
        child: const Icon(
          Icons.bookmark,
          size: 50,
          color: Colors.red,
        ),
        onTap: () {
          favoritesBox.delete(book.id);

          setState(() {
            favorite = false;
          });
        },
      ),
      child: GestureDetector(
        child: const Icon(
          Icons.bookmark_border,
          size: 50,
        ),
        onTap: () {
          favoritesBox.put(book.id, book);

          setState(() {
            favorite = true;
          });
        },
      ),
    );
  }
}
