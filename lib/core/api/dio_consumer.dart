
import 'package:awraq/core/api/api_consumer.dart';
import 'package:dio/dio.dart';


class DioConsumer implements ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    //dio.options.baseUrl = EndPoints.baseUrl;

    // ✅ لازم تمرري نفس dio للـ interceptor
    // dio.interceptors.add(
    //  // ApiInterceptors(dio: dio),
    // );

    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        requestHeader: true,
        responseBody: true,
        responseHeader: true,
        error: true,
      ),
    );
  }

  @override
  Future<dynamic> delete({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      //throw ServerException.handleDioError(e);
    }
  }

  @override
  Future<dynamic> get({
    required String path,
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
      //throw ServerException.handleDioError(e);
    }
  }

  @override
  Future<dynamic> patch({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
     // throw ServerException.handleDioError(e);
    }
  }

  @override
  Future<dynamic> post({
    required String path,
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );

      return response.data;
    } on DioException catch (e) {
     // throw ServerException.handleDioError(e);
    }
  }
}