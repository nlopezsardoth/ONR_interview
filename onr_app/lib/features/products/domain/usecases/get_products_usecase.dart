import 'package:dartz/dartz.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/repositories/product_repository.dart';
import 'package:onr_app/features/shared/domain/usecases/generic_use_cases.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';

class GetProductsUseCase extends FutureUseCase<List<Product>, Unit> {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  @override
  ResultFuture<List<Product>> call(Unit noParams) {
    return repository.getProducts();
  }
}