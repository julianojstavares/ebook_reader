import 'package:ebook_reader/features/home/domain/repositories/ibooks_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class DownloadEbookUseCase {
  final IBooksRepository booksRepository;

  DownloadEbookUseCase({
    required this.booksRepository,
  });

  Future<void> call({
    required String url,
    required String savePath,
    required String fileName,
  }) async {
    await booksRepository.downloadEbook(url, savePath, fileName);
    return;
  }
}
