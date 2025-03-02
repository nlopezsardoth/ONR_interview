import 'dart:async';

import 'package:dio/dio.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/shared/utils/extensions/request_logger.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';
import 'package:onr_app/features/shared/data/networking/constants/dio_constants.dart';
import 'package:onr_app/features/shared/data/networking/constants/timeout_constants.dart';

abstract class RequestHandler {
  ApiResponseFuture<T> get<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) fromJson,
    bool requiresToken = true,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  });

  ApiResponseFuture<T> post<T>({
    required String endpoint,
    T Function(Map<String, dynamic> json)? fromJson,
    bool requiresToken = true,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  });

  ApiResponseFuture<T> put<T>({
    required String endpoint,
    T Function(Map<String, dynamic> json)? fromJson,
    bool requiresToken = true,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  });

  ApiResponseFuture<T> delete<T>({
    required String endpoint,
    T Function(Map<String, dynamic> json)? fromJson,
    bool requiresToken = true,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  });
}

class RequestHandlerImpl
    with ApiResponseHandler, RequestLogger
    implements RequestHandler {
  RequestHandlerImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  Map<String, dynamic> _buildHeaders({
    bool requiresToken = true,
    Map<String, dynamic>? headers,
    String? apiKey,
  }) {
    final combinedHeaders = {
      if (requiresToken) DioConstants.requiresToken: true,
      if (apiKey != null) DioConstants.apiKey: apiKey,
      if (headers != null) ...headers,
    };
    return combinedHeaders;
  }

  @override
  ApiResponseFuture<T> get<T>({
    required String endpoint,
    required T Function(Map<String, dynamic> json) fromJson,
    bool requiresToken = true,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  }) async {
    final mapHeader = _buildHeaders(
      requiresToken: requiresToken,
      headers: headers,
      apiKey: apiKey,
    );
    logRequest(
      method: 'GET',
      endpoint: endpoint,
      queryParameters: queryParameters,
      headers: mapHeader,
    );

    try {
      final response = await executeCall<T>(
        _dio.get(
          endpoint,
          queryParameters: queryParameters,
          options: Options(
            headers: mapHeader,
          ),
        ),
        fromJson,
      ).timeout(timeoutConstants.connectTimeout);

      await logResponse(response, endpoint: endpoint);

      return response;
    } on TimeoutException catch (e) {
      logError(e);
      return ApiResponse.error(
          failure: InternetConnectionFailure(message: e.message ?? 'TimeOut'));
    } on Exception catch (e) {
      logError(e);
      return ApiResponse.error(
          failure:
              ServerFailure(message: e.toString(), statusCode: e.hashCode));
    }
  }

  @override
  ApiResponseFuture<T> delete<T>({
    required String endpoint,
    T Function(Map<String, dynamic> json)? fromJson,
    bool requiresToken = true,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  }) async {
    final mapHeader = _buildHeaders(
      requiresToken: requiresToken,
      headers: headers,
      apiKey: apiKey,
    );
    logRequest(
      method: 'DELETE',
      endpoint: endpoint,
      queryParameters: queryParameters,
      headers: mapHeader,
    );

    try {
      final response = await executeCall<T>(
        _dio.delete<Map<String, dynamic>>(
          endpoint,
          queryParameters: queryParameters,
          options: Options(
            headers: mapHeader,
          ),
        ),
        fromJson,
      ).timeout(timeoutConstants.connectTimeout);

      await logResponse(response, endpoint: endpoint);

      return response;
    } on TimeoutException catch (e) {
      logError(e);
      return ApiResponse.error(
          failure: InternetConnectionFailure(message: e.message ?? 'TimeOut'));
    } on Exception catch (e) {
      logError(e);
      return ApiResponse.error(
          failure:
              ServerFailure(message: e.toString(), statusCode: e.hashCode));
    }
  }

  @override
  ApiResponseFuture<T> post<T>({
    required String endpoint,
    T Function(Map<String, dynamic> json)? fromJson,
    bool requiresToken = true,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  }) async {
    final mapHeader = _buildHeaders(
      requiresToken: requiresToken,
      headers: headers,
      apiKey: apiKey,
    );
    logRequest(
      method: 'POST',
      endpoint: endpoint,
      queryParameters: queryParameters,
      headers: mapHeader,
      body: body,
    );

    try {
      final response = await executeCall<T>(
        _dio.post<Map<String, dynamic>>(
          endpoint,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            headers: mapHeader,
          ),
        ),
        fromJson,
      ).timeout(timeoutConstants.connectTimeout);

      await logResponse(response, endpoint: endpoint);

      return response;
    } on TimeoutException catch (e) {
      logError(e);
      return ApiResponse.error(
          failure: InternetConnectionFailure(message: e.message ?? 'TimeOut'));
    } on Exception catch (e) {
      logError(e);
      return ApiResponse.error(
          failure:
              ServerFailure(message: e.toString(), statusCode: e.hashCode));
    }
  }

  @override
  ApiResponseFuture<T> put<T>({
    required String endpoint,
    T Function(Map<String, dynamic> json)? fromJson,
    bool requiresToken = true,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    String? apiKey,
  }) async {
    final mapHeader = _buildHeaders(
      requiresToken: requiresToken,
      headers: headers,
      apiKey: apiKey,
    );
    logRequest(
      method: 'PUT',
      endpoint: endpoint,
      queryParameters: queryParameters,
      headers: mapHeader,
      body: body,
    );

    try {
      final response = await executeCall<T>(
        _dio.put<Map<String, dynamic>>(
          endpoint,
          data: body,
          queryParameters: queryParameters,
          options: Options(
            headers: mapHeader,
          ),
        ),
        fromJson,
      ).timeout(timeoutConstants.connectTimeout);

      await logResponse(response, endpoint: endpoint);

      return response;
    } on TimeoutException catch (e) {
      logError(e);
      return ApiResponse.error(
          failure: InternetConnectionFailure(message: e.message ?? 'TimeOut'));
    } on Exception catch (e) {
      logError(e);
      return ApiResponse.error(
          failure:
              ServerFailure(message: e.toString(), statusCode: e.hashCode));
    }
  }
}
