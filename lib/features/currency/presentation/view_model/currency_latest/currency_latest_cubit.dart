import 'package:black_market/core/data/services/connection_services.dart';
import 'package:black_market/core/data/services/local_database_services.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/utils/constants.dart';
import 'package:black_market/features/currency/data/models/bank_model/bank_model.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/services/bank_services.dart';
import 'package:black_market/features/currency/data/services/currency_services.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'currency_latest_state.dart';

class CurrencyLatestCubit extends Cubit<CurrencyLatestState> {
  CurrencyLatestCubit({
    required BankServices bankServices,
    required ConnectionServices connectionServices,
    required CurrencyServices currencyServices,
    required LocalDatabaseServices localDatabaseServices,
  }) : super(CurrencyLatestInitial()) {
    _bankServices = bankServices;
    _connectionServices = connectionServices;
    _currencyServices = currencyServices;
    _localDatabaseServices = localDatabaseServices;
  }

  List<CurrencyModel>? _currencies;

  late BankServices _bankServices;
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
        (connectionFailure) async {
          var returnedData = await _localDatabaseServices.get(
            boxName: kCurrencyBox,
            key: kCurrencyKey,
          );

          if (returnedData != null) {
            _currencies = [];
            for (var element in returnedData) {
              _currencies!.add(element);
            }
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
                CurrencyLatestFailure(
                  errMessage: failure.errMessage,
                  currencies: _currencies,
                ),
              );
            },
            //success
            (currencies) async {
              Either<Failure, List<BankModel>> bankResult =
                  await _bankServices.getAllBanks();

              bankResult.fold(
                //error
                (serverFailure) {
                  emit(
                    CurrencyLatestFailure(
                      errMessage: serverFailure.errMessage,
                      currencies: _currencies,
                    ),
                  );
                },
                //success
                (bankModel) {
                  for (var currencyIndex = 0;
                      currencyIndex < currencies.length;
                      currencyIndex++) {
                    for (var bankIndex = 0;
                        bankIndex < currencies[currencyIndex].bankPrices.length;
                        bankIndex++) {
                      currencies[currencyIndex].bankPrices[bankIndex].bankName =
                          bankModel
                              .firstWhere(
                                (element) =>
                                    element.id ==
                                    currencies[currencyIndex]
                                        .bankPrices[bankIndex]
                                        .bankId,
                              )
                              .name;
                    }
                  }
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
        },
      );
    }
  }
}
