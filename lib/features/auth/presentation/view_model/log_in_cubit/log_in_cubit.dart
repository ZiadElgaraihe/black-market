import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
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
    required AppCubit appCubit,
    required AuthServices authServices,
    required ConnectionServices connectionServices,
    required LocalDatabaseServices localDatabaseServices,
    required SecureDatabaseServices secureDatabaseServices,
  }) : super(LogInInitial()) {
    _appCubit = appCubit;
    _authServices = authServices;
    _connectionServices = connectionServices;
    _localDatabaseServices = localDatabaseServices;
    _secureDatabaseServices = secureDatabaseServices;
  }

  late AppCubit _appCubit;
  late AuthServices _authServices;
  late ConnectionServices _connectionServices;
  late LocalDatabaseServices _localDatabaseServices;
  late SecureDatabaseServices _secureDatabaseServices;

  String? email;
  String? password;
  bool remeberMe = false;

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
          (userModel) async {
            _appCubit.userModel = userModel;
            if (remeberMe) {
              Future.wait(
                [
                  _localDatabaseServices.store<User>(
                    boxName: kUserBox,
                    key: kUserKey,
                    value: userModel.user,
                  ),
                  _secureDatabaseServices.storeInSecureStorage(
                    key: kTokenKey,
                    value: userModel.token,
                  ),
                ],
              );
            }
            emit(LogInSuccess());
          },
        );
      },
    );
  }
}
