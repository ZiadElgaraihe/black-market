import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmedPassword,
  });

  Future<Either<Failure, UserModel>> logIn({
    required String email,
    required String password,
  });
}
