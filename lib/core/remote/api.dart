import 'package:dio/dio.dart';
import 'package:starter_kit/core/remote/remote_error.dart';
import 'package:starter_kit/core/remote/remote_response.dart';
import 'package:starter_kit/services/auth/token_service.dart';
import 'package:starter_kit/utils/constants.dart';
import 'package:starter_kit/utils/store.dart';

class Api {
  final String url;
  final Map<String, dynamic>? data;

  final TokenService tokenService = TokenService();

  Api(this.url, {this.data});

  Future<Dio> _dio() async {
    final token = await tokenService.getToken();
    final locale =
        await Store.getString(Constants.LOCALE_KEY) ??
        Constants.defaultLanguage;
    final options = BaseOptions(
      baseUrl: Constants.API_URL,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': locale,
        if (token != null) 'Authorization': 'Bearer $token',
      },
    );

    return Dio(options);
  }

  Future<void> get({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) {
    return _request(
      'GET',
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  Future<void> post({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) {
    return _request(
      'POST',
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  Future<void> put({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) {
    return _request(
      'PUT',
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  Future<void> delete({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) {
    return _request(
      'DELETE',
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  Future<void> patch({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) {
    return _request(
      'PATCH',
      beforeSend: beforeSend,
      onSuccess: onSuccess,
      onError: onError,
    );
  }

  Future<void> _request(
    String method, {
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    beforeSend?.call();
    try {
      final response = await (await _dio()).request<dynamic>(
        url,
        data: method == 'GET' ? null : data,
        queryParameters: method == 'GET' ? data : null,
        options: Options(method: method),
      );
      onSuccess?.call(RemoteResponse.fromData(response.data));
    } on DioException catch (error) {
      if (onError == null) {
        rethrow;
      }
      onError(RemoteError.fromDio(error));
    }
  }
}
