import 'package:mindset/utils/formatter.dart';

class User {
  int? id;
  String? pseudo;
  bool? active;
  DateTime? lastActive;
  DateTime? createdAt;
  DateTime? updatedAt;
  DateTime? deletedAt;

  User({
    this.id,
    this.pseudo,
    this.lastActive,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    pseudo = json['pseudo'];
    active = json['active'];
    lastActive = json['last_active'] == null
        ? null
        : DateTime.parse(json['last_active']);
    createdAt = json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at']);
    updatedAt = json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at']);
    deletedAt = json['deleted_at'] == null
        ? null
        : DateTime.parse(json['deleted_at']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'pseudo': pseudo,
      'active': active,
      'last_active': Formatter.date(lastActive, format: 'yyyy-MM-dd HH:mm:ss'),
      'created_at': Formatter.date(createdAt, format: 'yyyy-MM-dd HH:mm:ss'),
      'updated_at': Formatter.date(updatedAt, format: 'yyyy-MM-dd HH:mm:ss'),
      'deleted_at': Formatter.date(deletedAt, format: 'yyyy-MM-dd HH:mm:ss'),
    };
  }
}
