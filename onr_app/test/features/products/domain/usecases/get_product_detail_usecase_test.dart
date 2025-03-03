import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/entities/rating.dart';
import 'package:onr_app/features/products/domain/usecases/get_product_detail_usecase.dart';

import '../mocks/repositories_mock_helper.mocks.dart';

void main() {
  late GetProductDetailUseCase useCase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    useCase = GetProductDetailUseCase(mockRepository);
  });

  test('should get product detail from the repository', () async {
    // Arrange
    final product = Product(id: 1, title: "Test", description: "Desc", price: 99.99, category: "Category", image: "url", rating: Rating(rate: 4.5, count: 10));
    when(mockRepository.getProductDetail(1)).thenAnswer((_) async => Right(product));

    // Act
    final result = await useCase(1);

    // Assert
    expect(result, Right(product));
    verify(mockRepository.getProductDetail(1));
    verifyNoMoreInteractions(mockRepository);
  });
}
