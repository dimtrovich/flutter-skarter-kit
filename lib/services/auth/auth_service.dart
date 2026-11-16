import 'package:starter_kit/core/remote/api.dart';
import 'package:starter_kit/core/remote/remote_error.dart';
import 'package:starter_kit/core/remote/remote_response.dart';
import 'package:starter_kit/http/requests/auth_request.dart';

class AuthService {
  Future<void> login(
    AuthRequest request, {
    Function()? beforeSend,
    Function(dynamic response)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    await Api(
      'auth/login',
      data: request.toMap(),
    ).post(beforeSend: beforeSend, onSuccess: onSuccess, onError: onError);
  }

  Future<void> register(
    AuthRequest request, {
    Function()? beforeSend,
    Function(RemoteResponse response)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    await Api(
      'auth/register',
      data: request.toMap(),
    ).post(beforeSend: beforeSend, onSuccess: onSuccess, onError: onError);
  }
}
