import 'package:black_market/core/errors/failure.dart';

class FormatFailure extends Failure {
  FormatFailure({
    required String errMessage,
  }) : super(errMessage: 'Invalid response format: $errMessage');
}
