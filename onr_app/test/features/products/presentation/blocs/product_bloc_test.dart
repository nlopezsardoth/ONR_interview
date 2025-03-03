import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/entities/rating.dart';
import 'package:onr_app/features/products/presentation/bloc/products_bloc.dart';
import '../../domain/mocks/usecases_mock_helper.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockGetProductsUseCase mockGetProductsUseCase;
  late MockGetProductDetailUseCase mockGetProductDetailUseCase;

  setUp(() {
    mockGetProductsUseCase = MockGetProductsUseCase();
    mockGetProductDetailUseCase = MockGetProductDetailUseCase();
    productBloc = ProductBloc(
      getProductsUseCase: mockGetProductsUseCase,
      getProductDetailUseCase: mockGetProductDetailUseCase,
    );
  });

  final Product mockProduct = const Product(
      id: 1,
      title: "Test",
      description: "Desc",
      price: 99.99,
      category: "Category",
      image: "url",
      rating: Rating(rate: 4.5, count: 10));

  final List<Product> mockProducts = [mockProduct, mockProduct.copyWith(id: 2)];

  test('Initial state should be ProductState with ProductStatus.initial', () {
    expect(productBloc.state, const ProductState());
  });

  blocTest<ProductBloc, ProductState>(
    'Emits [ProductLoading, ProductLoaded] when fetching products is successful',
    build: () {
      when(mockGetProductsUseCase.call(any))
          .thenAnswer((_) async => Right(mockProducts));
      return productBloc;
    },
    act: (bloc) => bloc.add(LoadProducts()),
    expect: () => [
      const ProductState(status: ProductStatus.loading),
      ProductState(status: ProductStatus.success, products: mockProducts),
    ],
  );

  blocTest<ProductBloc, ProductState>(
    'Emits [ProductLoading, ProductDetailLoaded] when fetching product detail is successful',
    build: () {
      when(mockGetProductDetailUseCase.call(any))
          .thenAnswer((_) async => Right(mockProduct));
      return productBloc;
    },
    act: (bloc) => bloc.add(const LoadProductDetail(1)),
    expect: () => [
      const ProductState(status: ProductStatus.loading),
      ProductState(status: ProductStatus.success, productDetail: mockProduct),
    ],
  );
}
