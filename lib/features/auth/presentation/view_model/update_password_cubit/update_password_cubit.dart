import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/request_cancellation_mixin.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'update_password_state.dart';

class UpdatePasswordCubit extends Cubit<UpdatePasswordState>
    with RequestCancellationMixin {
  UpdatePasswordCubit({
    required AppCubit appCubit,
    required AuthServices authServices,
    required ConnectionServices connectionServices,
  }) : super(UpdatePasswordInitial()) {
    _appCubit = appCubit;
    _authServices = authServices;
    _connectionServices = connectionServices;
  }

  late AppCubit _appCubit;
  late AuthServices _authServices;
  late ConnectionServices _connectionServices;

  String? email;
  String otp = '';
  String? password;
  String? confirmedPassword;

  @override
  Future<void> close() async {
    cancelRequest();
    await super.close();
  }

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
          cancelToken: cancelToken,
        );

        result.fold(
          //error
          (serverFailure) {
            if (isCancelled) return;
            emit(
              UpdatePasswordFailure(errMessage: serverFailure.errMessage),
            );
          },
          //success
          (userModel) async {
            _appCubit.userModel = userModel;
            emit(UpdatePasswordSuccess());
          },
        );
      },
    );
  }
}
