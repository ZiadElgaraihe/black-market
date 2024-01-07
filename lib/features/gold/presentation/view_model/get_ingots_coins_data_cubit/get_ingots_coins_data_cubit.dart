import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/gold/data/models/ingots_coins/ingots_coins_model.dart';
import 'package:black_market/features/gold/data/repos/gold_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'get_ingots_coins_data_state.dart';

class GetIngotsCoinsDataCubit extends Cubit<GetIngotsCoinsDataState> {
  GetIngotsCoinsDataCubit({
    required ConnectionServices connectionServices,
    required GoldServices goldServices,
  }) : super(GetIngotsCoinsDataInitial()) {
    _connectionServices = connectionServices;
    _goldServices = goldServices;
  }

  late ConnectionServices _connectionServices;
  late GoldServices _goldServices;

  List<IngotsModel>? ingots;
  List<GoldenCoinsModel>? goldenCoins;

  Future<void> getIngotsCoinsData({bool isRefresh = false}) async {
    if (!isRefresh && ingots != null && goldenCoins != null) {
      emit(GetIngotsCoinsDataSuccess());
    } else {
      Either<ConnectionFailure, void> connectionResult =
          await _connectionServices.checkInternetConnection();

      connectionResult.fold(
        //no connection
        (connectionFailure) {
          emit(
            GetIngotsCoinsDataFailure(errMessage: connectionFailure.errMessage),
          );
        },
        //connection
        (_) async {
          emit(GetIngotsCoinsDataLoading());
          
          Either<Failure, IngotsCoinsModel> result =
              await _goldServices.getIngotsCoinsData();

          result.fold(
            //error
            (failure) {
              emit(
                GetIngotsCoinsDataFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (ingotsCoinsModel) {
              ingots = ingotsCoinsModel.ingots;
              goldenCoins = ingotsCoinsModel.coins;
              emit(
                GetIngotsCoinsDataSuccess(),
              );
            },
          );
        },
      );
    }
  }
}
