import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'rest_client.dart';

@Injectable(as: IRestClient)
class CustomDio implements IRestClient {

  late Dio _dio;
  
  BaseOptions options = BaseOptions(
    connectTimeout: const Duration(seconds: 3),
  );

  @override
  Dio instance() => _dio;

  CustomDio() {
    _dio = Dio(options);
  }
}