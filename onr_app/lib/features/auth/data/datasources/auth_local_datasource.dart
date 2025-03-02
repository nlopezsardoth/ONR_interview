import 'dart:async';

import 'package:onr_app/features/shared/utils/api_response_handler.dart';

abstract class AuthLocalDataSource {
  /// Simulates a login process by returning a boolean value after a delay.
  Future<ApiResponse<bool>> login(String email, String password);

  /// Simulates a logout process by returning a boolean value after a delay.
  Future<ApiResponse<bool>> logout();
}
