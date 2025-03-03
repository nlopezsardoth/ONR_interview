import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:onr_app/features/products/data/repositories/product_repository_implementation.dart';
import 'package:onr_app/features/products/domain/entities/product.dart';
import 'package:onr_app/features/products/domain/usecases/get_product_detail_usecase.dart';
import 'package:onr_app/features/products/domain/usecases/get_products_usecase.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/error_bottom_sheet_model.dart';

part 'products_event.dart';
part 'products_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState>
    with ErrorBottomSheetStatusMixin {
  final GetProductsUseCase _getProductsUseCase;
  final GetProductDetailUseCase _getProductDetailUseCase;

  ProductBloc({
    GetProductsUseCase? getProductsUseCase,
    GetProductDetailUseCase? getProductDetailUseCase,
  })  : _getProductsUseCase =
            getProductsUseCase ?? GetProductsUseCase(ProductRepositoryImpl()),
        _getProductDetailUseCase = getProductDetailUseCase ??
            GetProductDetailUseCase(ProductRepositoryImpl()),
        super(const ProductState()) {
    on<LoadProducts>(_onLoadProducts);
    on<LoadProductDetail>(_onLoadProductDetail);
  }

  Future<void> _onLoadProducts(
      LoadProducts event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    final result = await _getProductsUseCase.call(unit);
    result.fold(
      (failure) {
        emit(state.copyWith(status: ProductStatus.failure));
        errorBottomSheetStatus.postCantLoadProductsError();
      },
      (products) => emit(
          state.copyWith(products: products, status: ProductStatus.success)),
    );
  }

  Future<void> _onLoadProductDetail(
      LoadProductDetail event, Emitter<ProductState> emit) async {
    emit(state.copyWith(status: ProductStatus.loading));
    final result = await _getProductDetailUseCase.call(event.productId);
    result.fold(
      (failure) {
        emit(state.copyWith(status: ProductStatus.failure));
        errorBottomSheetStatus.postCantLoadDetailError();
      },
      (product) => emit(state.copyWith(
          productDetail: product, status: ProductStatus.success)),
    );
  }
}
