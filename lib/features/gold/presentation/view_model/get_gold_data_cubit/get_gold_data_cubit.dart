import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/gold/data/models/gold/gold_model.dart';
import 'package:black_market/features/gold/data/repos/gold_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_gold_data_state.dart';

class GetGoldDataCubit extends Cubit<GetGoldDataState> {
  GetGoldDataCubit({
    required ConnectionServices connectionServices,
    required GoldServices goldServices,
  }) : super(GetGoldDataInitial()) {
    _connectionServices = connectionServices;
    _goldServices = goldServices;
  }

  late ConnectionServices _connectionServices;
  late GoldServices _goldServices;

  List<GoldModel>? golds;

  Future<void> getGoldData({bool isRefresh = false}) async {
    if (!isRefresh && golds != null) {
      emit(GetGoldDataSuccess());
    } else {
      Either<ConnectionFailure, void> connectionResult =
          await _connectionServices.checkInternetConnection();

      connectionResult.fold(
        //no connection
        (connectionFailure) {
          emit(
            GetGoldDataFailure(errMessage: connectionFailure.errMessage),
          );
        },
        //connection
        (_) async {
          emit(GetGoldDataLoading());

          Either<Failure, List<GoldModel>> result =
              await _goldServices.getGoldData();

          result.fold(
            //error
            (failure) {
              emit(
                GetGoldDataFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (golds) {
              this.golds = golds;

              emit(
                GetGoldDataSuccess(),
              );
            },
          );
        },
      );
    }
  }
}
