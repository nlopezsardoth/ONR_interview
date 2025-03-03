import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/data/datasources/remote_datasource.dart';
import 'package:onr_app/features/shared/data/datasources/remote_datasource_impl.dart';
import 'package:onr_app/features/products/data/mappers/product_mapper.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/repositories/product_repository.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';

class ProductRepositoryImpl implements ProductRepository {
  final RemoteDataSource _remoteDataSource;

  ProductRepositoryImpl({RemoteDataSource? remoteDataSource})
      : _remoteDataSource = remoteDataSource ?? RemoteDataSourceImpl();

  @override
  ResultFuture<List<Product>> getProducts() async {
    final response = await _remoteDataSource.getProducts();
    if (response.isSuccess) {
      final result = ProductModelMapper.toEntityList(response.data!);
      return Right(result);
    }
    return Left(response.failure!);
  }

  @override
  ResultFuture<Product> getProductDetail(int id) async {
    final response = await _remoteDataSource.getProductDetail(id);
    if (response.isSuccess) {
      final result = response.data!.toEntity();
      return Right(result);
    }
    return Left(response.failure!);
  }
}
