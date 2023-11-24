import 'package:ebook_reader/features/home/data/datasources/ibooks_datasource.dart';
import 'package:ebook_reader/features/home/domain/entities/book.dart';
import 'package:ebook_reader/features/home/domain/repositories/ibooks_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IBooksRepository)  
class BooksRepository implements IBooksRepository {
  final IBooksDataSource booksDataSource;

  BooksRepository({
    required this.booksDataSource,
  });

  @override
  Future<List<BookEntity>> fetchBooks() async {
    return await booksDataSource.fetchBooks();
  }
  
  @override
  Future<void> downloadEbook(String url, String savePath, String fileName) async {
    await booksDataSource.downloadEbook(url, savePath, fileName);
    return;
  }
}
