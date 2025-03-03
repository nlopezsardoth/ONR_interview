import 'package:onr_app/features/shared/utils/typedefs.dart';
import '../entities/product.dart';

abstract class ProductRepository {
  ResultFuture<List<Product>> getProducts();
  ResultFuture<Product> getProductDetail(int id);
}
