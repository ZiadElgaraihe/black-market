import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/features/currency/data/models/currency_model.dart';
import 'package:dartz/dartz.dart';

abstract class CurrencyRepo {
  Future<Either<Failure, List<CurrencyModel>>> latest();
}
