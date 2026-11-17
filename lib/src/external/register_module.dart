import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import 'dio.dart';

@module
abstract class RegisterModule {
  @singleton
  Dio get dio => DioConfig().dio;
}
