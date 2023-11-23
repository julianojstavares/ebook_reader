import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ebook_reader/core/errors/dio_error_handler.dart';
import 'package:ebook_reader/features/home/domain/use_cases/download_ebook.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:vocsy_epub_viewer/epub_viewer.dart';

import 'show_ebook_event.dart';
import 'show_ebook_state.dart';

@lazySingleton
class ShowEbookBloc extends Bloc<ShowEbookEvent, ShowEbookState> {
  final DownloadEbookUseCase downloadEbookUseCase;

  ShowEbookBloc({
    required this.downloadEbookUseCase,
  }) : super(ShowEbookLoading()) {
    on<Displayed>(_onDisplayed);
  }

  void _onDisplayed(Displayed event, Emitter<ShowEbookState> emit) async {
    final Directory? downloadsDir = await getExternalStorageDirectory();

    if (downloadsDir == null) {
      const message = "Não foi possível obter o diretório de download";
      emit(ShowEbookError(message: message));
      return;
    }

    final savePath = downloadsDir.path;
    final fileName = "${event.book.title}.epub";

    bool fileExists = File('$savePath/$fileName').existsSync();

    if (!fileExists) {
      log(
          name: "ShowEbookBloc",
          "O arquivo $fileName não existe no diretório: $savePath");

      try {
        log(name: "ShowEbookBloc", "Baixando arquivo");

        await downloadEbookUseCase(
          savePath: savePath,
          fileName: fileName,
          url: event.book.downloadUrl,
        );
      } catch (e) {
        String message = "$e";

        if (e is DioException) {
          message = DioErrorHandler.handleError(e);
        }

        emit(ShowEbookError(message: message));

        return;
      }
    }

    emit(ShowEbookOpen());

    log(name: "ShowEbookBloc", "Tentando abrir ebook");

    VocsyEpub.setConfig(
      themeColor: Colors.white,
      identifier: "iosBook",
      scrollDirection: EpubScrollDirection.ALLDIRECTIONS,
      allowSharing: true,
      enableTts: true,
      nightMode: true,
    );

    VocsyEpub.locatorStream.listen((locator) {
      log('LOCATOR: $locator');
    });

    VocsyEpub.open("$savePath/$fileName");
  }
}
