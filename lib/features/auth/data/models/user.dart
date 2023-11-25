part of 'user_model.dart';

class User {
  int id;
  int roleId;
  String name;
  String email;
  String avatar;
  String createdAt;
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
      avatar: data['avatar'],
      createdAt: data['created_at'],
      updatedAt: data['updated_at'],
    );
  }
}
