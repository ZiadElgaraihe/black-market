import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/services/currency_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_latest_state.dart';

class CurrencyLatestCubit extends Cubit<CurrencyLatestState> {
  CurrencyLatestCubit({
    required ConnectionServices connectionServices,
    required CurrencyServices currencyServices,
    required LocalDatabaseServices localDatabaseServices,
  }) : super(CurrencyLatestInitial()) {
    _connectionServices = connectionServices;
    _currencyServices = currencyServices;
    _localDatabaseServices = localDatabaseServices;
  }

  List<CurrencyModel>? _currencies;

  late ConnectionServices _connectionServices;
  late CurrencyServices _currencyServices;
  late LocalDatabaseServices _localDatabaseServices;

  Future<void> getLatest({bool isReload = false}) async {
    if (!isReload && _currencies != null) {
      emit(
        CurrencyLatestSuccess(currencies: _currencies!),
      );
    } else {
      Either<ConnectionFailure, void> connectionResult =
          await _connectionServices.checkInternetConnection();

      connectionResult.fold(
        //no connection
        (connectionFailure) async{
          _currencies = await _localDatabaseServices.get<List<CurrencyModel>>(
            boxName: kCurrencyBox,
            key: kCurrencyKey,
          );

          if (_currencies != null) {
            emit(
              CurrencyLatestSuccess(currencies: _currencies!),
            );
          } else {
            emit(
              CurrencyLatestFailure(errMessage: connectionFailure.errMessage),
            );
          }
        },
        //connection
        (_) async {
          emit(CurrencyLatestLoading());

          Either<Failure, List<CurrencyModel>> result =
              await _currencyServices.latest();

          result.fold(
            //error
            (failure) {
              emit(
                CurrencyLatestFailure(errMessage: failure.errMessage),
              );
            },
            //success
            (currencies) {
              _currencies = currencies;
              _localDatabaseServices.store<List<CurrencyModel>>(
                boxName: kCurrencyBox,
                key: kCurrencyKey,
                value: currencies,
              );
              emit(
                CurrencyLatestSuccess(currencies: currencies),
              );
            },
          );
        },
      );
    }
  }
}
