import 'package:dio/dio.dart';

class RemoteError {
  final DioException? exception;
  final int? code;
  final dynamic errors;
  final String? message;

  RemoteError({this.exception, this.code, this.errors, this.message});

  static RemoteError fromDio(dynamic error) {
    if (error is DioException) {
      final rawData = error.response?.data;
      final Map<String, dynamic> data =
          rawData is Map<String, dynamic> ? rawData : {};

      return RemoteError(
        message: data['message']?.toString() ?? error.message ?? 'Erreur réseau',
        code: data.containsKey('code') ? data['code'] : error.response?.statusCode,
        errors: data.containsKey('errors') ? data['errors'] : null,
        exception: error,
      );
    }

    return RemoteError(message: error?.toString() ?? 'Erreur inconnue');
  }
}
