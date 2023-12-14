import 'dart:io';

import 'package:black_market/core/errors/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

Future<Either<Failure, T>> executeAndHandleErrors<T>(
  Future<T> Function() function,
) async {
  try {
    T result = await function();

    return right(result);
  } on DioException catch (error) {
    // Handle Dio-specific exceptions (network and server communication)
    return left(
      ServerFailure.fromDioException(dioException: error),
    );
  } on SocketException catch (error) {
    // Handle socket exceptions (network-related issues)
    return left(
      ConnectionFailure(errMessage: error.message),
    );
  } on FormatException catch (error) {
    // Handle format exceptions (parsing issues)
    return left(
      FormatFailure(errMessage: error.message),
    );
  } catch (error) {
    // Handle any other unexpected errors
    return left(
      Failure(errMessage: error.toString()),
    );
  }
}
