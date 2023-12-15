import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/currency/data/models/currency_model/currency_model.dart';
import 'package:black_market/features/currency/data/repos/currency_repo.dart';
import 'package:dartz/dartz.dart';

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

        List<CurrencyModel> currencies = [];

        for (var currency in data) {
          if (currency['id'] == 21) {
            break;
          }
          currencies.add(
            CurrencyModel.fromJson(data: currency),
          );
        }
        return currencies;
      },
    );
  }
}
