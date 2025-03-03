import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/repositories/product_repository.dart';
import 'package:onr_app/features/shared/domain/usecases/generic_use_cases.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';

class GetProductDetailUseCase extends FutureUseCase<Product, int> {
  final ProductRepository repository;

  GetProductDetailUseCase(this.repository);

  @override
  ResultFuture<Product> call(int id) {
    return repository.getProductDetail(id);
  }
}