import 'package:ebook_reader/core/service_locator/service_locator.dart';
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_bloc.dart';
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_event.dart';
import 'package:flutter/material.dart';

class FetchBooksErrorWidget extends StatelessWidget {
  final String message;

  const FetchBooksErrorWidget({
    super.key,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final splitted = message.split(':');
    final title = splitted.sublist(0, 4).join(' ');
    final txt = splitted.sublist(4).join(' ');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: Card(
            elevation: 5,
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Column(
                children: [
                  const Icon(Icons.error_outline, color: Colors.red),
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    txt,
                    textAlign: TextAlign.center,
                    maxLines: 6,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        ElevatedButton(
          onPressed: () => getIt.get<FetchBooksBloc>().add(Fetched()),
          child: const Text("Tentar Novamente"),
        ),
      ],
    );
  }
}
