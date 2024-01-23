import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/features/profile/data/repos/log_out_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'log_out_state.dart';

class LogOutCubit extends Cubit<LogOutState> {
  LogOutCubit({
    required AppCubit appCubit,
    required LogOutServices logOutServices,
  }) : super(LogOutInitial()) {
    _appCubit = appCubit;
    _logOutServices = logOutServices;
  }

  late AppCubit _appCubit;
  late LogOutServices _logOutServices;

  Future<void> logOut() async {
    emit(LogOutLoading());

    await Future.delayed(
      const Duration(seconds: 1),
      () async {
        await _logOutServices.logOut();
        _appCubit.userModel = null;
      },
    );

    emit(LogOutSuccess());
  }
}
