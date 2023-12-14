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

part 'log_in_state.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit({
    required AuthServices authServices,
    required ConnectionServices connectionServices,
    required LocalDatabaseServices localDatabaseServices,
  }) : super(LogInInitial()) {
    _authServices = authServices;
    _connectionServices = connectionServices;
    _localDatabaseServices = localDatabaseServices;
  }

  late AuthServices _authServices;
  late ConnectionServices _connectionServices;
  late LocalDatabaseServices _localDatabaseServices;

  String? email;
  String? password;

  Future<void> logIn() async {
    Either<ConnectionFailure, void> connectionResult =
        await _connectionServices.checkInternetConnection();
    connectionResult.fold(
      //no connection
      (connectionFailure) {
        emit(
          LogInFailure(errMessage: connectionFailure.errMessage),
        );
      },
      //connection
      (_) async {
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
            emit(LogInSuccess());
          },
        );
      },
    );
  }
}
