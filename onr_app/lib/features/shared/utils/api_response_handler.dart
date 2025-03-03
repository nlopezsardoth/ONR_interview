import 'package:onr_app/features/shared/data/errors/failures.dart';

typedef ApiResponseFuture<T> = Future<ApiResponse<T>>;


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
