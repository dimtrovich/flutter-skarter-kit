import 'dart:convert';

import 'package:mindset/core/remote/api.dart';
import 'package:mindset/core/remote/remote_error.dart';
import 'package:mindset/entities/user.dart';
import 'package:mindset/utils/constants.dart';
import 'package:mindset/utils/store.dart';

class UserService {
  Future<User?> getLoggedUserInfo() async {
    String? userInfo = await Store.getString(Constants.USER_INFOS_KEY);
    if (userInfo == null) {
      return null;
    }
    try {
      return User.fromJson(jsonDecode(userInfo));
    } catch (_) {
      return null;
    }
  }

  Future<bool> saveUserInfo(User user) async {
    return Store.set(Constants.USER_INFOS_KEY, user.toJson());
  }

  Future<bool> deleteLoggedUserInfo() async {
    return await Store.remove(Constants.USER_INFOS_KEY);
  }

  Future<void> loggedUser({
    Function(User user)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    User? user = await getLoggedUserInfo();

    if (user != null) {
      onSuccess!(user);
    } else {
      await getByToken(
        onError: onError,
        onSuccess: (user) {
          saveUserInfo(user);
          onSuccess!(user);
        },
      );
    }
  }

  Future<void> getByToken({
    Function(User user)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    Api('auth/me').get(
      onSuccess: (data) {
        onSuccess!(User.fromJson(data.result));
      },
      onError: onError,
    );
  }
}
