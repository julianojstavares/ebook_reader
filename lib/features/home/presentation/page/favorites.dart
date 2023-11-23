import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../widgets/bookshelf_grid.dart';

@RoutePage()
class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<BookEntity>('favoritesBox');

    return ValueListenableBuilder(
      valueListenable: favoritesBox.listenable(),
      builder: (context, Box<BookEntity> box, _) {
        log(name: "FavoritesTab", "${box.values.toList()}");

        return Visibility(
          visible: box.isNotEmpty,
          replacement: const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                "Você ainda não marcou um livro como favorito",
              ),
            ),
          ),
          child: BookshelfGrid(books: box.values.toList()),
        );
      },
    );
  }
}
