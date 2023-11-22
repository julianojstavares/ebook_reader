import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:ebook_reader/features/home/domain/repositories/ibooks_repository.dart';

class FetchBooksUseCase {
  final IBooksRepository iBooksRepository;

  FetchBooksUseCase({
    required this.iBooksRepository,
  });

  Future<List<BookEntity>> call() async {
    final List<BookEntity> books = await iBooksRepository.fetchBooks();
    return books;
  }

}
