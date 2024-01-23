part of 'package:black_market/features/currency/data/repos/currency_repo.dart';

class CurrencyServices implements CurrencyRepo {
  CurrencyServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  Map<String, dynamic>? _filterData;

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
  Future<Either<Failure, void>> filter() async {
    return await executeAndHandleErrors<void>(
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
            'type': 'live',
          },
        );

        _filterData = data['live_prices'];
      },
    );
  }

  @override
  List<FilterPriceModel> getLivePriceForCurrency({
    required int currencyId,
  }) {
    List<FilterPriceModel> filterPrices = <FilterPriceModel>[];

    for (var filterPrice in _filterData!['$currencyId']) {
      filterPrices.add(
        FilterPriceModel.fromJson(data: filterPrice),
      );
    }

    return filterPrices;
  }
}
