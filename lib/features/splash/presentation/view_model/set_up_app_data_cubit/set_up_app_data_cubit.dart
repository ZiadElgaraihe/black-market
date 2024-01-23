import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/data/services/secure_database_services.dart';
import 'package:black_market/core/presentation/view_model/app_cubit/app_cubit.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/auth/data/models/user/user.dart';
import 'package:black_market/features/auth/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'set_up_app_data_state.dart';

class SetUpAppDataCubit extends Cubit<SetUpAppDataState> {
  SetUpAppDataCubit({
    required AppCubit appCubit,
    required LocalDatabaseServices localDatabaseServices,
    required SecureDatabaseServices secureDatabaseServices,
  }) : super(SetUpAppDataSuccess()) {
    _appCubit = appCubit;
    _localDatabaseServices = localDatabaseServices;
    _secureDatabaseServices = secureDatabaseServices;
  }

  late AppCubit _appCubit;
  late LocalDatabaseServices _localDatabaseServices;
  late SecureDatabaseServices _secureDatabaseServices;

  Future<void> setUpUserData() async {
    User? user = await _localDatabaseServices.get<User?>(
      boxName: kUserBox,
      key: kUserKey,
    );

    String? token = await _secureDatabaseServices.getFromSecureStorage(
      key: kTokenKey,
    );

    if (user != null && token != null) {
      _appCubit.userModel = UserModel.fromLocalDatabase(
        user: user,
        token: token,
      );
    }

    emit(SetUpAppDataSuccess());
  }
}
