import 'package:dio/dio.dart';
import 'package:task/core/error/error_model.dart';

class ServerException implements Exception {
  final ErrorModel errorModel;

  ServerException({required this.errorModel});

}
void handelDioException(DioException exception) {
  switch (exception.type) {
    case DioExceptionType.connectionTimeout:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));
    case DioExceptionType.sendTimeout:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));
    case DioExceptionType.receiveTimeout:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));
    case DioExceptionType.badCertificate:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));
    case DioExceptionType.cancel:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));
    case DioExceptionType.connectionError:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));
    case DioExceptionType.unknown:
      ServerException(
          errorModel: ErrorModel.fromJson(exception.response!.data));

    case DioExceptionType.badResponse:
      switch (exception.response!.statusCode) {
        case 400:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
        case 401:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
        case 403:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
        case 404:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
        case 409:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
        case 422:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
        case 504:
          throw ServerException(
              errorModel: ErrorModel.fromJson(exception.response!.data));
      }
  }
}
