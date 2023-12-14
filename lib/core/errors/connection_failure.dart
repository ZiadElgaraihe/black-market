part of 'failure.dart';

class ConnectionFailure extends Failure {
  ConnectionFailure({
    required String errMessage,
  }) : super(errMessage: 'Network error: $errMessage');
}
