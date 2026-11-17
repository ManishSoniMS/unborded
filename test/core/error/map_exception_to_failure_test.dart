import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:unbordered/src/core/error/map_exception_to_failure.dart';
import 'package:unbordered/src/core/utils/enums/enums.dart';

DioException _bad(int status, {String? message}) => DioException(
  requestOptions: RequestOptions(path: '/x'),
  type: DioExceptionType.badResponse,
  response: Response(
    requestOptions: RequestOptions(path: '/x'),
    statusCode: status,
    data: {'message': message},
  ),
);

void main() {
  test('network exceptions map to noInternet / timeout', () {
    expect(mapError(const SocketException('x')).code, FailureCodes.noInternet);
    expect(mapError(TimeoutException('slow')).code, FailureCodes.timeout);
  });

  test('HTTP status maps to failure code; server message wins', () {
    expect(mapError(_bad(401)).code, FailureCodes.unauthorized);
    expect(mapError(_bad(404)).code, FailureCodes.notFound);
    expect(mapError(_bad(422)).code, FailureCodes.validation);
    expect(mapError(_bad(500)).code, FailureCodes.server);
    expect(mapError(_bad(422, message: 'Too low')).message, 'Too low');
  });
}
