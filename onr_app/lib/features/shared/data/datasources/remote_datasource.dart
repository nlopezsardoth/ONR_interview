import 'package:onr_app/features/products/data/models/product_model.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/users/data/models/user_model.dart';

abstract class RemoteDataSource {
  Future<ApiResponse<List<ProductModel>>> getProducts();
  Future<ApiResponse<ProductModel>> getProductDetail(int id);
  Future<ApiResponse<List<UserModel>>> getUsers();
}
