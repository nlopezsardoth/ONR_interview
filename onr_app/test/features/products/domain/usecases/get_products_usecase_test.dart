import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:dartz/dartz.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/entities/rating.dart';
import 'package:onr_app/features/products/domain/usecases/get_products_usecase.dart';

import '../mocks/repositories_mock_helper.mocks.dart';

void main() {
  late GetProductsUseCase useCase;
  late MockProductRepository mockRepository;

  setUp(() {
    mockRepository = MockProductRepository();
    useCase = GetProductsUseCase(mockRepository);
  });

  test('should get a list of products from the repository', () async {
    // Arrange
    final products = [Product(id: 1, title: "Test", description: "Desc", price: 99.99, category: "Category", image: "url", rating: Rating(rate: 4.5, count: 10))];
    when(mockRepository.getProducts()).thenAnswer((_) async => Right(products));

    // Act
    final result = await useCase(unit);

    // Assert
    expect(result, Right(products));
    verify(mockRepository.getProducts());
    verifyNoMoreInteractions(mockRepository);
  });
}
