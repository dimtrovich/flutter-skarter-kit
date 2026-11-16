import 'package:dio/dio.dart';
import 'package:mindset/core/remote/remote_error.dart';
import 'package:mindset/core/remote/remote_response.dart';
import 'package:mindset/services/auth/token_service.dart';
import 'package:mindset/utils/constants.dart';
import 'package:mindset/utils/store.dart';

class Api {
  final String url;
  // final String? token;
  final Map<String, dynamic>? data;

  final TokenService tokenService = TokenService();

  Api(this.url, {this.data});

  Future<Dio> _dio() async {
    String? token = await tokenService.getToken();
    String locale = await Store.getString(Constants.LOCALE_KEY) ?? Constants.defaultLanguage;
    
    BaseOptions options = BaseOptions(
      baseUrl: Constants.API_URL,
      connectTimeout: const Duration(minutes: 1),
      receiveTimeout: const Duration(minutes: 1),
      headers: {
        'Accept': 'application/json',
        'Accept-Language': locale,
      },
    );

    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    Dio dioR = Dio(options);

    /* (_dioR.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    }; */

    return dioR;
  }

  void get({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    beforeSend?.call();
    (await _dio())
        .get(url, queryParameters: data)
        .then((res) {
          if (onSuccess != null) onSuccess(RemoteResponse.fromMap(res.data));
        })
        .catchError((error) {
          if (onError != null) onError(RemoteError.fromDio(error));
        });
  }

  void post({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    beforeSend?.call();
    (await _dio())
        .post(url, data: data!)
        .then((res) {
          if (onSuccess != null) onSuccess(RemoteResponse.fromMap(res.data));
        })
        .catchError((error) {
          if (onError != null) onError(RemoteError.fromDio(error));
        });
  }

  void put({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    beforeSend?.call();
    (await _dio())
        .put(url, data: data!)
        .then((res) {
          if (onSuccess != null) onSuccess(RemoteResponse.fromMap(res.data));
        })
        .catchError((error) {
          if (onError != null) onError(RemoteError.fromDio(error));
        });
  }

  void delete({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    beforeSend?.call();
    (await _dio())
        .delete(url, data: data!)
        .then((res) {
          if (onSuccess != null) onSuccess(RemoteResponse.fromMap(res.data));
        })
        .catchError((error) {
          if (onError != null) onError(RemoteError.fromDio(error));
        });
  }

  void patch({
    Function()? beforeSend,
    Function(RemoteResponse data)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    beforeSend?.call();
    (await _dio())
        .patch(url, data: data!)
        .then((res) {
          if (onSuccess != null) onSuccess(RemoteResponse.fromMap(res.data));
        })
        .catchError((error) {
          if (onError != null) onError(RemoteError.fromDio(error));
        });
  }
}
