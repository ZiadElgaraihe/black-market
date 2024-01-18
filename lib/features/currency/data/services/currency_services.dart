import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/models/filter_price_model/filter_price_model.dart';
import 'package:black_market/features/currency/data/repos/currency_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:intl/intl.dart';

class CurrencyServices implements CurrencyRepo {
  CurrencyServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;
  
  @override
  Future<Either<Failure, List<CurrencyModel>>> latest() async {
    return await executeAndHandleErrors<List<CurrencyModel>>(
      () async {
        dynamic data = await _dioHelper.getRequest(
          endPoint: 'currencies/latest',
        );

        List<CurrencyModel> currencies = <CurrencyModel>[];

        for (var currency in data) {
          if (currency['id'] == 21 ||
              currency['bank_prices'].isEmpty ||
              currency['black_market_prices'].isEmpty) {
            continue;
          }
          currencies.add(
            CurrencyModel.fromJson(data: currency),
          );
        }
        return currencies;
      },
    );
  }

  @override
  Future<Either<Failure, List<FilterPriceModel>>> filter({
    required int currencyId,
  }) async {
    return await executeAndHandleErrors(
      () async {
        DateTime sevenDaysAgo = DateTime.now().subtract(
          const Duration(days: 7),
        );
        String formattedDate =
            DateFormat('yyyy-MM-dd', 'en').format(sevenDaysAgo);

        Map<String, dynamic> data = await _dioHelper.getRequest(
          endPoint: 'currencies/historical',
          queryParameters: {
            'start_date': formattedDate,
            'currency_id': currencyId,
            'type': 'live',
          },
        );

        List<FilterPriceModel> filterPrices = <FilterPriceModel>[];

        for (var filterPrice in data['live_prices']['$currencyId']) {
          filterPrices.add(
            FilterPriceModel.fromJson(data: filterPrice),
          );
        }

        return filterPrices;
      },
    );
  }
}
