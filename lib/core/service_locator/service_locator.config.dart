// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:ebook_reader/core/data/rest_client/custom_dio.dart' as _i4;
import 'package:ebook_reader/core/data/rest_client/rest_client.dart' as _i3;
import 'package:ebook_reader/features/home/data/datasources/ibooks_datasource.dart'
    as _i5;
import 'package:ebook_reader/features/home/data/repositories/books_repository.dart'
    as _i8;
import 'package:ebook_reader/features/home/domain/repositories/ibooks_repository.dart'
    as _i7;
import 'package:ebook_reader/features/home/domain/use_cases/fetch_books.dart'
    as _i9;
import 'package:ebook_reader/features/home/external/dio_books.dart' as _i6;
import 'package:ebook_reader/features/home/presentation/bloc/fetch_books/fetch_books_bloc.dart'
    as _i10;
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
    gh.factory<_i3.IRestClient>(() => _i4.CustomDio());
    gh.factory<_i5.IBooksDataSource>(
        () => _i6.DioBooks(restClient: gh<_i3.IRestClient>()));
    gh.factory<_i7.IBooksRepository>(
        () => _i8.BooksRepository(booksDataSource: gh<_i5.IBooksDataSource>()));
    gh.factory<_i9.FetchBooksUseCase>(() =>
        _i9.FetchBooksUseCase(iBooksRepository: gh<_i7.IBooksRepository>()));
    gh.lazySingleton<_i10.FetchBooksBloc>(
        () => _i10.FetchBooksBloc(gh<_i9.FetchBooksUseCase>()));
    return this;
  }
}
