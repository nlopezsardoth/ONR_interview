import 'dart:io';

import 'package:dio/dio.dart';
import 'package:onr_app/features/shared/data/datasources/remote_datasource.dart';
import 'package:onr_app/features/products/data/models/product_model.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';
import 'package:onr_app/features/shared/data/networking/dio_builder.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/users/data/models/user_model.dart';

class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _dio;

  RemoteDataSourceImpl({Dio? dio})
      : _dio = dio ??
            DioBuilder.createDio(
              options: BaseOptions(baseUrl: "https://fakestoreapi.com"),
              interceptors: [
                LogInterceptor(logPrint: (o) => print(o.toString())),
              ],
            );

  @override
  Future<ApiResponse<List<ProductModel>>> getProducts() async {
    final result = await _dio.get('/products');
    try {
      if (result.statusCode == HttpStatus.accepted ||
          result.statusCode == HttpStatus.ok) {
        return ApiResponse.success(parseProducts(result.data));
      } else {
        return ApiResponse.error(
            failure: ServerFailure(
                message: "ServerFailure",
                statusCode: result.statusCode ?? 500));
      }
    } catch (e) {
      return ApiResponse.error(
          failure: ServerFailure(
              message: "ServerFailure", statusCode: result.statusCode ?? 500));
    }
  }

  @override
  Future<ApiResponse<ProductModel>> getProductDetail(int id) async {
    final result = await _dio.get('/products/$id');
    if (result.statusCode == HttpStatus.accepted ||
        result.statusCode == HttpStatus.ok) {
      return ApiResponse.success(ProductModel.fromJson(result.data));
    } else {
      return ApiResponse.error(
          failure: ServerFailure(
              message: "ServerFailure", statusCode: result.statusCode ?? 500));
    }
  }

  @override
  Future<ApiResponse<List<UserModel>>> getUsers() async {
    final result = await _dio.get('/users');
    try {
      if (result.statusCode == HttpStatus.accepted ||
          result.statusCode == HttpStatus.ok) {
        return ApiResponse.success(parseUsers(result.data));
      } else {
        return ApiResponse.error(
            failure: ServerFailure(
                message: "ServerFailure",
                statusCode: result.statusCode ?? 500));
      }
    } catch (e) {
      return ApiResponse.error(
          failure: ServerFailure(
              message: "ServerFailure", statusCode: result.statusCode ?? 500));
    }
  }
  

  List<ProductModel> parseProducts(List<dynamic> jsonList) {
    return jsonList
        .map((json) => ProductModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }

  List<UserModel> parseUsers(List<dynamic> jsonList) {
    return jsonList
        .map((json) => UserModel.fromJson(json as Map<String, dynamic>))
        .toList();
  }
}
