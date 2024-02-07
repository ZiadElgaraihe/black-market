part of 'package:black_market/features/auth/data/repos/auth_repo.dart';

class AuthServices implements AuthRepo {
  AuthServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, UserModel>> logIn({
    required CancelToken cancelToken,
    required String email,
    required String password,
  }) async {
    return await executeAndHandleErrors<UserModel>(
      () async {
        Map<String, dynamic> data = await _dioHelper.postRequest(
          endPoint: 'login',
          data: {
            'email': email,
            'password': password,
          },
          cancelToken: cancelToken,
        );
        return UserModel.fromJson(data: data);
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> signUp({
    required CancelToken cancelToken,
    required String fullName,
    required String email,
    required String password,
    required String confirmedPassword,
  }) async {
    return await executeAndHandleErrors<UserModel>(
      () async {
        Map<String, dynamic> data = await _dioHelper.postRequest(
          endPoint: 'register',
          data: {
            'name': fullName,
            'email': email,
            'password': password,
            'password_confirmation': confirmedPassword,
          },
          cancelToken: cancelToken,
        );
        return UserModel.fromJson(data: data);
      },
    );
  }

  @override
  Future<Either<Failure, void>> forgetPassword({
    required CancelToken cancelToken,
    required String email,
  }) async {
    return await executeAndHandleErrors<void>(
      () async {
        await _dioHelper.postRequest(
          endPoint: 'forget_password',
          data: {
            'email': email,
          },
          cancelToken: cancelToken,
        );
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> updatePassword({
    required CancelToken cancelToken,
    required String email,
    required String otp,
    required String password,
    required String confirmedPassword,
  }) async {
    return await executeAndHandleErrors<UserModel>(
      () async {
        Map<String, dynamic> data = await _dioHelper.postRequest(
          endPoint: 'update_forgotten_password',
          data: {
            'email': email,
            'otp': otp,
            'password': password,
            'password_confirmation': confirmedPassword,
          },
          cancelToken: cancelToken,
        );
        return UserModel.fromJson(data: data);
      },
    );
  }
}
