import 'dart:io';

import 'package:black_market/core/errors/connection_failure.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/errors/format_failure.dart';
import 'package:black_market/core/errors/server_failure.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/currency/data/models/currency_model.dart';
import 'package:black_market/features/currency/data/repos/currency_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class CurrencyServices implements CurrencyRepo {
  CurrencyServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;
  @override
  Future<Either<Failure, List<CurrencyModel>>> latest() async {
    try {
      dynamic data = await _dioHelper.getRequest(
        endPoint: 'currencies/latest',
      );

      List<CurrencyModel> currencies = [];

      for (var currency in data) {
        currencies.add(
          CurrencyModel.fromJson(data: currency),
        );
      }

      return right(currencies);
    } on DioException catch (error) {
      // Handle Dio-specific exceptions (network and server communication)
      return left(
        ServerFailure.fromDioException(dioException: error),
      );
    } on SocketException catch (error) {
      // Handle socket exceptions (network-related issues)
      return left(
        ConnectionFailure(errMessage: error.message),
      );
    } on FormatException catch (error) {
      // Handle format exceptions (parsing issues)
      return left(
        FormatFailure(errMessage: error.message),
      );
    } catch (error) {
      // Handle any other unexpected errors
      return left(
        ServerFailure(errMessage: error.toString()),
      );
    }
  }
}
