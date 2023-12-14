import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/auth/data/models/user/user.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:black_market/features/auth/data/services/auth_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState> {
  UpdatePasswordCubit({
    required AuthServices authServices,
    required ConnectionServices connectionServices,
    required LocalDatabaseServices localDatabaseServices,
  }) : super(UpdatePasswordInitial()) {
    _authServices = authServices;
    _connectionServices = connectionServices;
    _localDatabaseServices = localDatabaseServices;
  }

  late AuthServices _authServices;
  late ConnectionServices _connectionServices;
  late LocalDatabaseServices _localDatabaseServices;

  String? email;
  String otp = '';
  String? password;
  String? confirmedPassword;

  Future<void> updatePassword() async {
    Either<ConnectionFailure, void> connectionResult =
        await _connectionServices.checkInternetConnection();
    connectionResult.fold(
      //no connection
      (connectionFailure) {
        emit(
          UpdatePasswordFailure(errMessage: connectionFailure.errMessage),
        );
      },
      //connection
      (_) async {
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
            _localDatabaseServices
              ..store<User>(
                boxName: kUserBox,
                key: kUserKey,
                value: userModel.user,
              )
              ..storeInSecureStorage(
                key: kTokenKey,
                value: userModel.token,
              );
            emit(UpdatePasswordSuccess());
          },
        );
      },
    );
  }
}
