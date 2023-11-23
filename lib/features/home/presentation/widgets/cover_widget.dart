import 'package:ebook_reader/core/service_locator/service_locator.dart';
import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:ebook_reader/features/home/presentation/bloc/show_ebook/show_ebook_bloc.dart';
import 'package:ebook_reader/features/home/presentation/bloc/show_ebook/show_ebook_event.dart';
import 'package:flutter/material.dart';

import 'favorite_toggle.dart';

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
    final bloc = getIt.get<ShowEbookBloc>();
    return Container(
      color: Colors.transparent,
      height: 280,
      child: Column(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              GestureDetector(
                onTap: () => bloc.add(Displayed(book: book)),
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(book.coverUrl),
                      fit: BoxFit.fill,
                    ),
                    border: Border.all(),
                  ),
                ),
              ),
              const Positioned(
                top: -7,
                right: -10,
                child: FavoriteToggle(),
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


