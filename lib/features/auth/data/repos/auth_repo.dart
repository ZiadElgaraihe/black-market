import 'package:black_market/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  Future<Either<Failure, void>> signUp({
    required String fullName,
    required String email,
    required String password,
    required String confirmedPassword,
  });
}
