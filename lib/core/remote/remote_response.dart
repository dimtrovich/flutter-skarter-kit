import 'dart:convert';

class RemoteResponse {
  RemoteResponse({
    this.success,
    this.message,
    this.result,
  });

  final bool? success;
  final String? message;
  final dynamic result;

  factory RemoteResponse.fromJson(String str) => RemoteResponse.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RemoteResponse.fromMap(Map<String, dynamic> json) => RemoteResponse(
    success: json["success"] ?? false,
    message: json["message"],
    result: json["result"],
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "result": result,
  };
}
