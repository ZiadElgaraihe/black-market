import 'package:black_market/core/errors/failure.dart';
import 'package:black_market/core/functions/execute_and_handle_errors.dart';
import 'package:black_market/core/helpers/dio_helper.dart';
import 'package:black_market/features/gold/data/models/gold/gold_model.dart';
import 'package:dartz/dartz.dart';

part 'package:black_market/features/gold/data/services/gold_services.dart';

abstract class GoldRepo {
  Future<Either<Failure, List<GoldModel>>> getGoldData();
}
