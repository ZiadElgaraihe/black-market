import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/connection_failure.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({
    required AuthServices authServices,
    required ConnectionServices connectionServices,
  }) : super(SignUpInitial()) {
    _authServices = authServices;
    _connectionServices = connectionServices;
  }

  late AuthServices _authServices;
  late ConnectionServices _connectionServices;

  String? fullName;
  String? email;
  String? password;
  String? confirmedPassword;

  Future<void> signUp() async {
    Either<ConnectionFailure, void> connectionResult =
        await _connectionServices.checkInternetConnection();
    connectionResult.fold(
      //no connection
      (connectionFailure) {
        emit(
          SignUpFailure(errMessage: connectionFailure.errMessage),
        );
      },
      //connection
      (_) async {
        emit(SignUpLoading());

        Either<Failure, void> result = await _authServices.signUp(
          fullName: fullName!,
          email: email!,
          password: password!,
          confirmedPassword: confirmedPassword!,
        );

        result.fold(
          //error
          (serverFailure) {
            emit(
              SignUpFailure(errMessage: serverFailure.errMessage),
            );
          },
          //success
          (_) {
            emit(SignUpSuccess());
          },
        );
      },
    );
  }
}
