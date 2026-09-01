import 'dart:convert';

import 'package:mindset/core/remote/api.dart';
import 'package:mindset/core/remote/remote_error.dart';
import 'package:mindset/entities/user.dart';
import 'package:mindset/utils/constants.dart';
import 'package:mindset/utils/store.dart';

class UserService {
  Future<String?> getLoggedUserInfo() async {
    return await Store.getString(Constants.USER_INFOS_KEY);
  }

  Future<bool> deleteLoggedUserInfo() async {
    return await Store.remove(Constants.USER_INFOS_KEY);
  }

  Future<void> loggedUser({
    Function(User user)? onSuccess,
    Function(RemoteError error)? onError,
  }) async {
    String? userInfo = await getLoggedUserInfo();

    if (userInfo != null) {
      User user = User.fromJson(jsonDecode(userInfo));
      onSuccess!(user);
    } else {
      await getByToken(
        onError: onError,
        onSuccess: (user) {
          Store.set(Constants.USER_INFOS_KEY, user.toJson());
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
