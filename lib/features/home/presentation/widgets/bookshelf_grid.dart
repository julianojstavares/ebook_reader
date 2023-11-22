import 'package:flutter/material.dart';

import 'cover_widget.dart';

class BookshelfGrid extends StatelessWidget {
  const BookshelfGrid({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(10),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 3 / 4,
      ),
      itemCount: 12,
      itemBuilder: (context, index) => CoverWidget(index: index),
    );
  }
}
