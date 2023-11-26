import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit({
    required AuthServices authServices,
  }) : super(UpdatePasswordInitial()) {
    _authServices = authServices;
  }

  late AuthServices _authServices;

  String? email;
  String otp = '';
  String? password;
  String? confirmedPassword;

  Future<void> updatePassword() async {
    emit(UpdatePasswordLoading());

    Either<Failure, UserModel> result = await _authServices.updatePassword(
      email: email!,
      otp: otp,
      password: password!,
      confirmedPassword: confirmedPassword!,
    );

    result.fold(
      //error
      (serverFailure) {
        emit(
          UpdatePasswordFailure(errMessage: serverFailure.errMessage),
        );
      },
      //success
      (userModel) {
        emit(UpdatePasswordSuccess());
      },
    );
  }
}
