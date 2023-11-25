class UserModel {
  int id;
  int roleId;
  String name;
  String email;
  String avatar;
  String createdAt;
  String updatedAt;

  UserModel({
    required this.id,
    required this.roleId,
    required this.name,
    required this.email,
    required this.avatar,
    required this.createdAt,
    required this.updatedAt,
  });

  factory UserModel.fromJson({required Map<String, dynamic> data}) {
    return UserModel(
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
