import 'package:black_market/core/errors/failure.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectionRepo {
  late Connectivity connectivity;

  Future<Either<ConnectionFailure, void>> checkInternetConnection();
}
