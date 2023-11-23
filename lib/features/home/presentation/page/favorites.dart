import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../widgets/bookshelf_grid.dart';

@RoutePage()
class FavoritesTab extends StatelessWidget {
  const FavoritesTab({super.key});

  @override
  Widget build(BuildContext context) {
    final favoritesBox = Hive.box<BookEntity>('favoritesBox');

    log(name: "FavoritesTab", "${favoritesBox.values.toList()}");

    return Visibility(
      visible: favoritesBox.isNotEmpty,
      replacement: const Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Text(
            "Você ainda não marcou um livro como favorito",
          ),
        ),
      ),
      child: BookshelfGrid(books: favoritesBox.values.toList()),
    );
  }
}
