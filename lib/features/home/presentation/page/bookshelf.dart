import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../widgets/fetch_books_bloc_widget.dart';

@RoutePage()
class BookshelfTab extends StatelessWidget {
  const BookshelfTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const FetchBooksBlocWidget();
  }
}
