import 'package:ebook_reader/features/home/data/models/book_model.dart';

abstract class IBooksDataSource {
  Future<List<BookModel>> fetchBooks();
}
