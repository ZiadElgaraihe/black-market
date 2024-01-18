import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/currency/data/models/bank_model/bank_model.dart';
import 'package:dartz/dartz.dart';

abstract class BankRepo {
  Future<Either<Failure, List<BankModel>>> getAllBanks();
}
