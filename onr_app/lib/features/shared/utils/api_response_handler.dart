import 'dart:io';
import 'package:dio/dio.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';

typedef ApiResponseFuture<T> = Future<ApiResponse<T>>;

mixin ApiResponseHandler {
  ApiResponseFuture<T> executeCall<T>(
      Future<Response<Map<String, dynamic>>> apiRequest,
      T Function(Map<String, dynamic> json)? fromJson) async {
    try {
      final response = await apiRequest;
      switch (response.statusCode) {
        case HttpStatus.ok:
        case HttpStatus.created:
        case HttpStatus.accepted:
          if (response.data != null) {
            if (fromJson == null) {
              return ApiResponse.success();
            }

            final result = fromJson(response.data!);
            return ApiResponse.success(result);
          } else {
            return ApiResponse.error(
                failure: ServerFailure(
              message: response.statusMessage ?? 'Response data is null',
              statusCode: response.statusCode!,
            ));
          }
        case HttpStatus.unauthorized:
          return ApiResponse.error(
              failure: LocalAuthFailure(
            message: response.statusMessage ?? 'Unauthorized access',
          ));
        case HttpStatus.badRequest:
        case HttpStatus.forbidden:
        case HttpStatus.notFound:
        case HttpStatus.conflict:
        case HttpStatus.internalServerError:
          return ApiResponse.error(
              failure: ServerFailure(
            message: response.statusMessage ?? 'Bad response',
            statusCode: response.statusCode!,
          ));
        default:
          return ApiResponse.error(
              failure: ServerFailure(
            message: response.statusMessage ?? 'Unauthorized access',
            statusCode: response.statusCode ?? HttpStatus.unauthorized,
          ));
      }
    } on DioException catch (dioException) {
      return _handleDioException<T>(dioException);
    } catch (e) {
      return ApiResponse.error(
          failure: ServerFailure(
        message: e.toString(),
        statusCode: HttpStatus.internalServerError,
      ));
    }
  }

  ApiResponse<T> _handleDioException<T>(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiResponse.error(
            failure: InternetConnectionFailure(
                message: dioException.message ?? 'TimeOut'));
      case DioExceptionType.badResponse:
        return ApiResponse.error(
            failure: ServerFailure(
          message: dioException.response!.statusMessage ?? 'Bad response',
          statusCode:
              dioException.response?.statusCode ?? HttpStatus.badRequest,
        ));
      case DioExceptionType.connectionError:
        return ApiResponse.error(
            failure: InternetConnectionFailure(
                message: dioException.message ?? 'Connection Error'));
      case DioExceptionType.cancel:
        return ApiResponse.error(
            failure: ServerFailure(
          message: dioException.message ?? 'Request cancelled',
          statusCode: dioException.response?.statusCode ??
              HttpStatus.clientClosedRequest,
        ));
      case DioExceptionType.unknown:
      default:
        return ApiResponse.error(
            failure: ServerFailure(
          message: dioException.message ?? 'Unknown error',
          statusCode: dioException.response?.statusCode ??
              HttpStatus.internalServerError,
        ));
    }
  }
}

class ApiResponse<T> {
  factory ApiResponse.success([T data]) = _ApiResponseSuccess<T>;

  factory ApiResponse.error({required Failure failure}) = _ApiResponseError<T>;

  ApiResponse._({this.data, this.failure});

  final T? data;
  final Failure? failure;

  bool get isSuccess => failure == null;

  @override
  String toString() {
    if (isSuccess) {
      return 'Success: $data';
    } else {
      return 'Error: $failure';
    }
  }
}

class _ApiResponseSuccess<T> extends ApiResponse<T> {
  _ApiResponseSuccess([T? data]) : super._(data: data, failure: null);
}

class _ApiResponseError<T> extends ApiResponse<T> {
  _ApiResponseError({required Failure failure})
      : super._(data: null, failure: failure);
}
