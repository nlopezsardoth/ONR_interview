import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/products/data/models/product_model.dart';
import 'package:onr_app/features/products/data/repositories/product_repository_implementation.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/entities/rating.dart';
import 'package:onr_app/features/shared/data/errors/failures.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';

import '../mocks/datasource_mock_helper.mocks.dart';


void main() {
  late ProductRepositoryImpl repository;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    repository = ProductRepositoryImpl(remoteDataSource: mockRemoteDataSource);
  });

  group('ProductRepositoryImpl', () {
    final tProductModel = ProductModel(
      id: 1,
      title: 'Test Product',
      description: 'Test Description',
      price: 99.99,
      category: 'Test Category',
      image: 'https://example.com/image.png',
      rating: RatingModel(rate: 4.5, count: 10),
    );

    final tProduct = Product(
      id: 1,
      title: 'Test Product',
      description: 'Test Description',
      price: 99.99,
      category: 'Test Category',
      image: 'https://example.com/image.png',
      rating: Rating(rate: 4.5, count: 10),
    );

    final tProductListModel = [tProductModel];

    test('should return List<Product> when remote data source call is successful', () async {
      when(mockRemoteDataSource.getProducts())
          .thenAnswer((_) async => ApiResponse.success(tProductListModel));

      final result = await repository.getProducts();

      expect(result,  isA<Right<Failure, List<Product>>>());
      verify(mockRemoteDataSource.getProducts());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Failure when remote data source call fails', () async {
      final failure = ServerFailure(message: "Server Error", statusCode: 500);
      when(mockRemoteDataSource.getProducts())
          .thenAnswer((_) async => ApiResponse.error(failure: failure));

      final result = await repository.getProducts();

      expect(result, equals(Left(failure)));
      verify(mockRemoteDataSource.getProducts());
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Product when getProductDetail is successful', () async {
      when(mockRemoteDataSource.getProductDetail(1))
          .thenAnswer((_) async => ApiResponse.success(tProductModel));

      final result = await repository.getProductDetail(1);

      expect(result, equals(Right(tProduct)));
      verify(mockRemoteDataSource.getProductDetail(1));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });

    test('should return Failure when getProductDetail fails', () async {
      final failure = ServerFailure(message: "Not Found", statusCode: 404);
      when(mockRemoteDataSource.getProductDetail(1))
          .thenAnswer((_) async => ApiResponse.error(failure: failure));

      final result = await repository.getProductDetail(1);

      expect(result, equals(Left(failure)));
      verify(mockRemoteDataSource.getProductDetail(1));
      verifyNoMoreInteractions(mockRemoteDataSource);
    });
  });
}
