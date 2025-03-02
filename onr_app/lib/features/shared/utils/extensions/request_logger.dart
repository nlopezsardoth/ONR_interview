import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/shared/data/errors/exceptions.dart';

mixin RequestLogger {
  void logRequest({
    required String method,
    required String endpoint,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    final buffer = StringBuffer()
      ..writeln('--- Request ---')
      ..writeln('Method: $method')
      ..writeln('Endpoint: $endpoint');

    if (queryParameters != null && queryParameters.isNotEmpty) {
      buffer.writeln('Query Parameters: ${jsonEncode(queryParameters)}');
    }

    if (headers != null && headers.isNotEmpty) {
      buffer.writeln('Headers: ${jsonEncode(headers)}');
    }

    if (body != null) {
      buffer.writeln(
          'Body: ${body is Map || body is List ? jsonEncode(body) : body}');
    }

    buffer.writeln('----------------');
    if (kDebugMode) {
      print(buffer.toString());
    }
  }

  Future<void> logResponse<T>(ApiResponse<T> response,
      {String? endpoint}) async {
    final buffer = StringBuffer()
      ..writeln('--- Response ---')
      ..writeln('Endpoint:  $endpoint')
      ..writeln('Is Success: ${response.isSuccess}');

    if (response.failure != null) {
      buffer.writeln('Failure: ${response.failure!.message}');
      buffer.writeln('StatusCode: ${response.failure!.statusCode}');
    }

    if (response.data != null) {
      buffer.writeln(
          'Data: ${response.data is Map || response.data is List ? jsonEncode(response.data) : response.data}');
    }

    buffer.writeln('----------------');
    if (kDebugMode) {
      print(buffer.toString());
    }
  }

  void logError(Exception error) {
    final buffer = StringBuffer();
    if (error is ServerException) {
      buffer
        ..writeln('--- Error ---')
        ..writeln('Type: ServerException')
        ..writeln('Message: ${error.message}')
        ..writeln('Status Code: ${error.statusCode}');
    } else if (error is AuthenticationException) {
      buffer
        ..writeln('--- Error ---')
        ..writeln('Type: AuthenticationException')
        ..writeln('Message: ${error.message}');
    } else if (error is InternetConnectionException) {
      buffer
        ..writeln('--- Error ---')
        ..writeln('Type: InternetConnectionException')
        ..writeln('Message: ${error.message}');
    } else if (error is LocalDatabaseException) {
      buffer
        ..writeln('--- Error ---')
        ..writeln('Type: LocalDatabaseException')
        ..writeln('Message: ${error.message}');
    } else {
      buffer
        ..writeln('--- Error ---')
        ..writeln('Type: Exception Error')
        ..writeln('Message: ${error.toString()}');
    }
    buffer.writeln('----------------');
    if (kDebugMode) {
      print(buffer.toString());
    }
  }
}
