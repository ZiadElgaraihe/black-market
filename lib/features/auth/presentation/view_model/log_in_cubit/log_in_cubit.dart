import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({
    required AuthServices authServices,
  }) : super(LogInInitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

  String? email;
  String? password;

  Future<void> logIn() async {
    emit(LogInLoading());

    Either<Failure, UserModel> result = await _authServices.logIn(
      email: email!,
      password: password!,
    );

    result.fold(
      //error
      (serverFailure) {
        emit(
          LogInFailure(errMessage: serverFailure.errMessage),
        );
      },
      //success
      (userModel) {
        emit(LogInSuccess());
      },
    );
  }
}
