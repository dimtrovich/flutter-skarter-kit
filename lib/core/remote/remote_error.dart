import 'package:dio/dio.dart';

class RemoteError {
  final DioException? exception;
  final int? code;
  final dynamic errors;
  final String? message;

  RemoteError({this.exception, this.code, this.errors, this.message});

  static RemoteError fromDio(DioException error) {
    Map<String, dynamic> data = error.response!.data;

    return RemoteError(
      message: data['message'] ?? error.message,
      code: data.containsKey('code') ? data['code'] : null,
      errors: data.containsKey('errors') ? data['errors'] : null,
      exception: error,
    );
  }
}
