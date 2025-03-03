part of 'products_bloc.dart';

enum ProductStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final ProductStatus status;
  final List<Product>? products;
  final Product? productDetail;

  const ProductState({
    this.status = ProductStatus.initial,
    this.products,
    this.productDetail,
  });

  ProductState copyWith({
    ProductStatus? status,
    List<Product>? products,
    Product? productDetail,
    String? errorMessage,
  }) {
    return ProductState(
      status: status ?? this.status,
      products: products ?? this.products,
      productDetail: productDetail ?? this.productDetail,
    );
  }

  @override
  List<Object?> get props => [status, products, productDetail];
}