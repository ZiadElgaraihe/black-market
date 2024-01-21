import 'package:hive_flutter/hive_flutter.dart';
part 'user.g.dart';

@HiveType(typeId: 0)
class User {
  @HiveField(0)
  int id;
  @HiveField(1)
  int roleId;
  @HiveField(2)
  String name;
  @HiveField(3)
  String email;
  @HiveField(4)
  String avatar;
  @HiveField(5)
  String createdAt;
  @HiveField(6)
  String updatedAt;

  User({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson({required Map<String, dynamic> data}) {
    return User(
      id: data['id'],
      roleId: data['role_id'],
      name: data['name'],
      email: data['email'],
      avatar: 'http://www.voipsys.space/storage/${data['avatar']}',
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
