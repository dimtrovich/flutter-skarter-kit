import 'dart:convert';

class RemoteResponse {
  RemoteResponse({this.success, this.message, this.result});

  final bool? success;
  final String? message;
  final dynamic result;

  factory RemoteResponse.fromJson(String str) =>
      RemoteResponse.fromData(json.decode(str));

  String toJson() => json.encode(toMap());

  factory RemoteResponse.fromData(dynamic data) {
    if (data is Map) {
      return RemoteResponse.fromMap(Map<String, dynamic>.from(data));
    }
    return RemoteResponse(success: true, result: data);
  }

  factory RemoteResponse.fromMap(Map<String, dynamic> json) => RemoteResponse(
    success: json["success"] ?? true,
    message: json["message"],
    result: json["result"] ?? json["data"] ?? json,
  );

  Map<String, dynamic> toMap() => {
    "success": success,
    "message": message,
    "result": result,
  };
}
