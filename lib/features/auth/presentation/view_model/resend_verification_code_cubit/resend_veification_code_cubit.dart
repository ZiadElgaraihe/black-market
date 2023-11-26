import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_veification_code_state.dart';

class ResendVeificationCodeCubit extends Cubit<ResendVeificationCodeState> {
  ResendVeificationCodeCubit({
    required AuthServices authServices,
  }) : super(ResendVeificationCodeInitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

  String? email;

  Future<void> resendVerificationCode() async {
    emit(ResendVeificationCodeLoading());

    Either<Failure, void> result =
        await _authServices.forgetPassword(email: email!);

    result.fold(
      //error
      (serverFailure) {
        emit(
          ResendVeificationCodeFailure(errMessage: serverFailure.errMessage),
        );
      },
      //success
      (_) {
        emit(
          ResendVeificationCodeSuccess(),
        );
      },
    );
  }
}
