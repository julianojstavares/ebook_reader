import 'package:ebook_reader/features/home/domain/entities/book.dart';

abstract class ShowEbookEvent {}

class Displayed extends ShowEbookEvent {
  final BookEntity book;

  Displayed({
    required this.book,
  });
}
