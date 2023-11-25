part 'user.dart';

class UserModel {
  User user;
  String token;

  UserModel({
    required this.user,
    required this.token,
  });

  factory UserModel.fromJson({required Map<String, dynamic> data}) {
    return UserModel(
      user: data['user'],
      token: data['access_token'],
    );
  }

  factory UserModel.fromLocalDatabase({
    required User user,
    required String token,
  }) {
    return UserModel(
      user: user,
      token: token,
    );
  }
}
