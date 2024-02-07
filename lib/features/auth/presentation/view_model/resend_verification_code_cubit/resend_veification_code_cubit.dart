import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/utils/request_cancellation_mixin.dart';
import 'package:black_market/features/auth/data/repos/auth_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'resend_veification_code_state.dart';

class ResendVeificationCodeCubit extends Cubit<ResendVeificationCodeState>
    with RequestCancellationMixin {
  ResendVeificationCodeCubit({
    required AuthServices authServices,
    required ConnectionServices connectionServices,
  }) : super(ResendVeificationCodeInitial()) {
    _authServices = authServices;
    _connectionServices = connectionServices;
  }

  late AuthServices _authServices;
  late ConnectionServices _connectionServices;

  String? email;

  @override
  Future<void> close() async {
    cancelRequest();
    await super.close();
  }

  Future<void> resendVerificationCode() async {
    Either<ConnectionFailure, void> connectionResult =
        await _connectionServices.checkInternetConnection();
    connectionResult.fold(
      //no connection
      (connectionFailure) {
        emit(
          ResendVeificationCodeFailure(
            errMessage: connectionFailure.errMessage,
          ),
        );
      },
      //connection
      (_) async {
        emit(ResendVeificationCodeLoading());

        Either<Failure, void> result = await _authServices.forgetPassword(
          email: email!,
          cancelToken: cancelToken,
        );

        result.fold(
          //error
          (serverFailure) {
            emit(
              ResendVeificationCodeFailure(
                  errMessage: serverFailure.errMessage),
            );
          },
          //success
          (_) {
            emit(
              ResendVeificationCodeSuccess(),
            );
          },
        );
      },
    );
  }
}
