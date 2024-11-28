import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:task/core/api/end_point.dart';

import '../error/exception.dart';
import 'api_consumer.dart';
import 'api_interceptor.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = ApiEndPoint.baseUrl;

    dio.options.headers = {
      'Authorization':
          'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7Il9pZCI6IjY3MjBmNTg4ODcxZDllMGI0N2I0MjYwNSIsInJvbGUiOiJhZG1pbiJ9LCJpYXQiOjE3MzI3MTk5Mzh9.ywk3dC2Y6gpqqHvyKrtLjcOqCGH52nk3yV_EFFB_vtk',
    };
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
      responseBody: true,
      request: true,
      requestHeader: true,
    ));
    dio.interceptors.add(DioInterceptors());
    dio.interceptors.add(LogInterceptor(
      error: true,
      request: true,
      requestHeader: true,
      responseBody: true,
      responseHeader: true,
    ));
  }

  @override
  Future delete(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future get(String path,
      {Map<String, dynamic>? queryParameters, Object? data}) async {
    try {
      final response =
          await dio.get(path, data: data, queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future patch(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future post(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }

  @override
  Future put(
    String path, {
    Map<String, dynamic>? queryParameters,
    dynamic data,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(path,
          data: isFormData ? FormData.fromMap(data) : data,
          queryParameters: queryParameters);
      return response;
    } on DioException catch (e) {
      handelDioException(e);
    }
  }
}
