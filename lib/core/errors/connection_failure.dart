import 'package:black_market/core/errors/failure.dart';

class ConnectionFailure extends Failure {
  ConnectionFailure({
    required String errMessage,
  }) : super(errMessage: 'Network error: $errMessage');
}
