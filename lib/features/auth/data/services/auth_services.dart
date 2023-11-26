import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/errors/server_failure.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

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
    try {
      Map<String, dynamic> data = await _dioHelper.postRequest(
        endPoint: 'login',
        data: {
          'email': email,
          'password': password,
        },
      );
      return right(
        UserModel.fromJson(data: data),
      );
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (error) {
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmedPassword,
  }) async {
    try {
      await _dioHelper.postRequest(
        endPoint: 'register',
        data: {
          'name': fullName,
          'email': email,
          'password': password,
          'password_confirmation': confirmedPassword,
        },
      );
      return right(null);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (error) {
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    }
  }

  @override
  Future<Either<Failure, void>> forgetPassword({required String email}) async {
    try {
      await _dioHelper.postRequest(
        endPoint: 'forget_password',
        data: {
          'email': email,
        },
      );

      return right(null);
    } on DioException catch (error) {
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } catch (error) {
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    }
  }
}
