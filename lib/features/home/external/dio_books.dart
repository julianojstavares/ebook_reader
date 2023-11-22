import 'package:dio/dio.dart';
import 'package:ebook_reader/features/home/data/datasources/ibooks_datasource.dart';
import 'package:ebook_reader/features/home/data/models/book_model.dart';

class DioBooks implements IBooksDataSource {
  final Dio dio;

  DioBooks({
    required this.dio,
  });

  @override
  Future<List<BookModel>> fetchBooks() async {
    const url = "https://escribo.com/books.json";

    final response = await dio.get(url);

    final List<dynamic> booksJson = response.data;

    final List<BookModel> books =
        booksJson.map((bookJson) => BookModel.fromJson(bookJson)).toList();

    return books;
  }
}
