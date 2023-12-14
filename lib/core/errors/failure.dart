import 'package:dio/dio.dart';

part 'connection_failure.dart';
part 'format_failure.dart';
part 'server_failure.dart';

class Failure {
  Failure({required this.errMessage});

  String errMessage;
}
