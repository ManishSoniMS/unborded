import 'package:dio/dio.dart';

import '../core/constants/api_constants.dart';

class DioConfig {
  DioConfig._() {
    _dio = Dio();
    _dio.options.baseUrl = ApiConstants.baseUrl;
    _dio.options.connectTimeout = Duration(seconds: 10);
  }

  factory DioConfig() => DioConfig._();

  late final Dio _dio;

  Dio get dio => _dio;
}
