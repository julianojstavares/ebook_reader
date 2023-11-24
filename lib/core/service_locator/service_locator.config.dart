// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ebook_reader/core/data/rest_client/custom_dio.dart' as _i5;
import 'package:ebook_reader/core/data/rest_client/rest_client.dart' as _i4;
import 'package:ebook_reader/core/routes/app_router.dart' as _i3;
import 'package:ebook_reader/features/home/data/datasources/ibooks_datasource.dart'
    as _i6;
import 'package:ebook_reader/features/home/data/repositories/books_repository.dart'
    as _i9;
import 'package:ebook_reader/features/home/domain/repositories/ibooks_repository.dart'
    as _i8;
import 'package:ebook_reader/features/home/domain/use_cases/download_ebook.dart'
    as _i10;
import 'package:ebook_reader/features/home/domain/use_cases/fetch_books.dart'
    as _i11;
import 'package:ebook_reader/features/home/external/dio_books.dart' as _i7;
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_bloc.dart'
    as _i13;
import 'package:ebook_reader/features/home/presentation/bloc/show_ebook/show_ebook_bloc.dart'
    as _i12;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppRouter>(() => _i3.AppRouter());
    gh.factory<_i4.IRestClient>(() => _i5.CustomDio());
    gh.factory<_i6.IBooksDataSource>(
        () => _i7.DioBooks(restClient: gh<_i4.IRestClient>()));
    gh.factory<_i8.IBooksRepository>(
        () => _i9.BooksRepository(booksDataSource: gh<_i6.IBooksDataSource>()));
    gh.factory<_i10.DownloadEbookUseCase>(() =>
        _i10.DownloadEbookUseCase(booksRepository: gh<_i8.IBooksRepository>()));
    gh.factory<_i11.FetchBooksUseCase>(() =>
        _i11.FetchBooksUseCase(iBooksRepository: gh<_i8.IBooksRepository>()));
    gh.lazySingleton<_i12.ShowEbookBloc>(() => _i12.ShowEbookBloc(
        downloadEbookUseCase: gh<_i10.DownloadEbookUseCase>()));
    gh.lazySingleton<_i13.FetchBooksBloc>(
        () => _i13.FetchBooksBloc(gh<_i11.FetchBooksUseCase>()));
    return this;
  }
}
