import 'package:ebook_reader/core/data/rest_client/rest_client.dart';
import 'package:ebook_reader/features/home/data/datasources/ibooks_datasource.dart';
import 'package:ebook_reader/features/home/data/models/book_model.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: IBooksDataSource)  
class DioBooks implements IBooksDataSource {
  final IRestClient restClient;

  DioBooks({
    required this.restClient,
  });

  @override
  Future<List<BookModel>> fetchBooks() async {
    final client = restClient.instance();
    
    const url = "https://escribo.com/books.json";

    final response = await client.get(url);

    final List<dynamic> booksJson = response.data;

    final List<BookModel> books =
        booksJson.map((bookJson) => BookModel.fromJson(bookJson)).toList();

    return books;
  }
}
