import 'package:dio/dio.dart';

mixin RequestCancellationMixin {
  CancelToken cancelToken = CancelToken();
  bool isCancelled = false;

  void cancelRequest() {
    if (!cancelToken.isCancelled) {
      cancelToken.cancel('Request cancelled by user');
      isCancelled = true;
    }
  }
}
