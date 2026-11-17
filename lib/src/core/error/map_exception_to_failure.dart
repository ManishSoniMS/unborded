import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';

import '../utils/enums/enums.dart';
import 'failure.dart';

Failure mapError(Object e) {
  if (e is SocketException) {
    return Failure(
      code: FailureCodes.noInternet,
      message: "No Internet.",
      object: e,
    );
  }

  if (e is TimeoutException) {
    return Failure(
      code: FailureCodes.timeout,
      message: e.message ?? "Connection timeout.",
      object: e,
    );
  }

  if (e is PlatformException && e.code.toLowerCase().contains('permission')) {
    return Failure(
      code: FailureCodes.permission,
      message: e.message ?? "No permission.",
      object: e,
    );
  }

  if (e is DioException) {
    switch (e.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Failure(
          code: FailureCodes.timeout,
          message: e.message ?? "Connection timeout.",
          object: e,
        );
      case DioExceptionType.connectionError:
        return Failure(
          code: FailureCodes.noInternet,
          message: e.message ?? "No internet.",
          object: e,
        );
      case DioExceptionType.badResponse:
        final code = e.response?.statusCode;
        final message = e.response?.data["message"];
        if (code == 401 || code == 403) {
          return Failure(
            code: FailureCodes.unauthorized,
            message:  message  ?? "Unauthorized user.",
            object: e,
          );
        }
        if (code == 404) {
          return Failure(
            code: FailureCodes.notFound,
            message: message ?? "Not found.",
            object: e,
          );
        }
        if (code == 422) {
          return Failure(
            code: FailureCodes.validation,
            message: message ?? "Invalid.",
            object: e,
          );
        }
        if (code != null && code >= 500) {
          return Failure(
            code: FailureCodes.server,
            message: message ?? "Something went wrong.",
            object: e,
          );
        }
        return Failure(
          code: FailureCodes.unknown,
          message: e.message ?? "Something went wrong.",
          object: e,
        );
      case DioExceptionType.cancel:
        return Failure(
          code: FailureCodes.unknown,
          message: e.message ?? "Something went wrong.",
          object: e,
        );
      default:
        return Failure(
          code: FailureCodes.unknown,
          message: e.message ?? "Something went wrong.",
          object: e,
        );
    }
  }

  return Failure(
    code: FailureCodes.unknown,
    message: "Something went wrong.",
    object: e,
  );
}
