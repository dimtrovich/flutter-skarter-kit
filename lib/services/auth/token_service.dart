import 'package:mindset/utils/constants.dart';
import 'package:mindset/utils/store.dart';

class TokenService {
  Future<bool> deleteToken() async {
    return Store.remove(Constants.ACCESS_TOKEN_KEY);
  }

  Future<String?> getToken() async {
    return Store.getString(Constants.ACCESS_TOKEN_KEY);
  }

  Future<bool> isAuthenticated() async {
    return await Store.getString(Constants.ACCESS_TOKEN_KEY) != null;
  }

  Future<bool> saveToken(String token) async {
    return await Store.set(Constants.ACCESS_TOKEN_KEY, token);
  }
}
