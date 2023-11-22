import 'package:ebook_reader/features/home/domain/entities/book.dart';

abstract class IBooksRepository {
  Future<List<BookEntity>> fetchBooks();
}
