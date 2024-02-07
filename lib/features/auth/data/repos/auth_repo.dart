import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

part 'package:black_market/features/auth/data/services/auth_services.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserModel>> signUp({
    required CancelToken cancelToken,
    required String fullName,
    required String email,
    required String password,
    required String confirmedPassword,
  });

  Future<Either<Failure, UserModel>> logIn({
    required CancelToken cancelToken,
    required String email,
    required String password,
  });

  Future<Either<Failure, void>> forgetPassword({
    required CancelToken cancelToken,
    required String email,
  });

  Future<Either<Failure, UserModel>> updatePassword({
    required CancelToken cancelToken,
    required String email,
    required String otp,
    required String password,
    required String confirmedPassword,
  });
}
