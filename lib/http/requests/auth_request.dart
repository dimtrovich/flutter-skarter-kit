import 'dart:convert';

class AuthRequest {
  final String code;
  final String pseudo;

  AuthRequest({required this.code, required this.pseudo});

  String toJson() => json.encode(toMap());

  Map<String, String> toMap() {
    return {'pseudo': pseudo, 'code': code};
  }
}
