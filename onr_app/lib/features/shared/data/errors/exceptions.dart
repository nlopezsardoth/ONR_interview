class ServerException implements Exception {
  const ServerException({required this.message, required this.statusCode});

  final String message;
  final int statusCode;

  @override
  String toString() {
    return 'ServerException{message: $message, statusCode: $statusCode}';
  }
}

class LocalDatabaseException implements Exception {
  const LocalDatabaseException({required this.message});

  final String message;

  @override
  String toString() {
    return 'LocalDatabaseException{message: $message}';
  }
}

class AuthenticationException implements Exception {
  const AuthenticationException({required this.message});

  final String message;

  @override
  String toString() {
    return 'AuthenticationException{message: $message}';
  }
}

class InternetConnectionException implements Exception {
  const InternetConnectionException({required this.message});

  final String message;
  @override
  String toString() {
    return 'InternetConnectionException{message: $message}';
  }
}
