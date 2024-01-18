import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthServices implements AuthRepo {
  AuthServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, UserModel>> logIn({
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
        );
        return UserModel.fromJson(data: data);
      },
    );
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmedPassword,
  }) async {
    return await executeAndHandleErrors<void>(
      () async {
        await _dioHelper.postRequest(
          endPoint: 'register',
          data: {
            'name': fullName,
            'email': email,
            'password': password,
            'password_confirmation': confirmedPassword,
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, void>> forgetPassword({
    required String email,
  }) async {
    return await executeAndHandleErrors<void>(
      () async {
        await _dioHelper.postRequest(
          endPoint: 'forget_password',
          data: {
            'email': email,
          },
        );
      },
    );
  }

  @override
  Future<Either<Failure, UserModel>> updatePassword({
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
        );
        return UserModel.fromJson(data: data);
      },
    );
  }
}
