import 'package:mockito/annotations.dart';
import 'package:onr_app/features/products/domain/usecases/get_product_detail_usecase.dart';
import 'package:onr_app/features/products/domain/usecases/get_products_usecase.dart';

@GenerateMocks([GetProductsUseCase, GetProductDetailUseCase])
class UsecasesMockHelper {}
