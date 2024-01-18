import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/currency/data/models/bank_model/bank_model.dart';
import 'package:black_market/features/currency/data/repos/bank_repo.dart';
import 'package:dartz/dartz.dart';

class BankServices implements BankRepo {
  BankServices({required DioHelper dioHelper}) {
    _dioHelper = dioHelper;
  }

  late DioHelper _dioHelper;

  @override
  Future<Either<Failure, List<BankModel>>> getAllBanks() async {
    return await executeAndHandleErrors<List<BankModel>>(() async {
      List<dynamic> data = await _dioHelper.getRequest(
        endPoint: 'banks',
      );

      List<BankModel> banks = [];

      for (var bank in data) {
        banks.add(
          BankModel.fromJson(data: bank),
        );
      }
      return banks;
    });
  }
}
