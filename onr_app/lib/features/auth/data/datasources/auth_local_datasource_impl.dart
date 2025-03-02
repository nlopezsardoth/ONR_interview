import 'dart:async';

import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/auth/data/datasources/auth_local_datasource.dart';

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  @override
  Future<ApiResponse<bool>> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse.success(true);
  }

  @override
  Future<ApiResponse<bool>> logout() async {
    await Future.delayed(const Duration(seconds: 1));
    return ApiResponse.success(true);
  }
}
