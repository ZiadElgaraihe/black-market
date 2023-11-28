import 'package:black_market/core/data/repos/connection_repo.dart';
import 'package:black_market/core/errors/connection_failure.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';

class ConnectionServices implements ConnectionRepo {
  @override
  Connectivity connectivity = Connectivity();

  @override
  Future<Either<ConnectionFailure, void>> checkInternetConnection() async {
    ConnectivityResult connectivityResult =
        await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return right(null);
    } else {
      return left(
        ConnectionFailure(errMessage: 'Check your internet connection'),
      );
    }
  }
}
