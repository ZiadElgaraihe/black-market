import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({
    required AuthServices authServices,
  }) : super(ForgetPasswordInitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

  String? email;

  Future<void> forgetPassword() async {
    emit(ForgetPasswordLoading());

    Either<Failure, void> result =
        await _authServices.forgetPassword(email: email!);

    result.fold(
      //error
      (serverFailure) {
        emit(
          ForgetPasswordFailure(errMessage: serverFailure.errMessage),
        );
      },
      //success
      (_) {
        emit(ForgetPasswordSuccess());
      },
    );
  }
}
