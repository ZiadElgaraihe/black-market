import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/filter_price_model/filter_price_model.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

part 'package:black_market/features/currency/data/services/currency_services.dart';

abstract class CurrencyRepo {
  Future<Either<Failure, List<CurrencyModel>>> latest();

  Future<Either<Failure, void>> filter();

  List<FilterPriceModel> getLivePriceForCurrency({
    required int currencyId,
  });
}
