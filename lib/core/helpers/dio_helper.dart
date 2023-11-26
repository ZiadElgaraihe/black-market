import 'package:dio/dio.dart';

class DioHelper {
  DioHelper() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://voipsys.space/api/',
      ),
    );
  }

  late Dio _dio;

  ///http get request
  Future<dynamic> getRequest({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    String? token,
  }) async {
    Map<String, dynamic>? headers;

    if (token != null) {
      headers = {'Authorization': 'Bearer $token'};
    }

    Response response = await _dio.get(
      endPoint,
      queryParameters: queryParameters,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }

  ///http post request
  Future<dynamic> postRequest({
    required String endPoint,
    Object? data,
    String? token,
  }) async {
    Map<String, dynamic> headers = {
      'Content-Type': 'application/json',
    };

    if (token != null) {
      headers.addAll({'Authorization': 'Bearer $token'});
    }

    Response response = await _dio.post(
      endPoint,
      data: data,
      options: Options(
        headers: headers,
      ),
    );

    return response.data;
  }
}
