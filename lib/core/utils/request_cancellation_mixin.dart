import 'package:dio/dio.dart';

mixin RequestCancellationMixin {
  CancelToken? cancelToken;
  bool isCancelled = false;

  void cancelRequest() {
    cancelToken!.cancel();
    isCancelled = true;
  }
}
