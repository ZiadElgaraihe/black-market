import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit({
    required AuthServices authServices,
    required ConnectionServices connectionServices,
  }) : super(ForgetPasswordInitial()) {
    _authServices = authServices;
    _connectionServices = connectionServices;
  }

  late AuthServices _authServices;
  late ConnectionServices _connectionServices;

  String? email;

  Future<void> forgetPassword() async {
    Either<ConnectionFailure, void> connectionResult =
        await _connectionServices.checkInternetConnection();
    connectionResult.fold(
      //no connection
      (connectionFailure) {
        emit(
          ForgetPasswordFailure(errMessage: connectionFailure.errMessage),
        );
      },
      //connection
      (_) async {
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
            emit(
              ForgetPasswordSuccess(email: email!),
            );
          },
        );
      },
    );
  }
}
