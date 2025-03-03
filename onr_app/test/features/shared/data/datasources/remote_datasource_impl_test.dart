import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:onr_app/features/products/data/models/product_model.dart';
import 'package:onr_app/features/shared/data/datasources/remote_datasource_impl.dart';
import 'package:onr_app/features/shared/utils/api_response_handler.dart';
import 'package:onr_app/features/users/data/models/user_model.dart';
import '../../../products/data/mocks/dio_mock_helper.mocks.dart';

@GenerateMocks([Dio])
void main() {
  late MockDio mockDio;
  late RemoteDataSourceImpl remoteDataSource;

  setUp(() {
    mockDio = MockDio();
    remoteDataSource = RemoteDataSourceImpl(dio: mockDio);
  });

  group('getProducts', () {
    final mockProduct = {
      "id": 1,
      "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
      "price": 109.95,
      "description":
          "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
      "category": "men's clothing",
      "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
      "rating": {"rate": 3.9, "count": 120}
    };
    final mockResponse = [mockProduct];

    test('should return List<ProductModel> on success', () async {
      when(mockDio.get('/products')).thenAnswer(
        (_) async => Response(
          data: mockResponse,
          statusCode: HttpStatus.ok,
          requestOptions: RequestOptions(path: '/products'),
        ),
      );

      final result = await remoteDataSource.getProducts();

      expect(result, isA<ApiResponse<List<ProductModel>>>());
      expect(result.data, isNotNull);
      expect(result.data!.first.id, 1);
    });

    test('should return ProductModel on success', () async {
      when(mockDio.get('/products/1')).thenAnswer(
        (_) async => Response(
          data: mockProduct,
          statusCode: HttpStatus.ok,
          requestOptions: RequestOptions(path: '/products/1'),
        ),
      );

      final result = await remoteDataSource.getProductDetail(1);

      expect(result, isA<ApiResponse<ProductModel>>());
      expect(result.data, isNotNull);
    });
  });
  group('getUsers', () {
    final mockResponse = [
      {
        "address": {
          "geolocation": {"lat": "-37.3159", "long": "81.1496"},
          "city": "kilcoole",
          "street": "new road",
          "number": 7682,
          "zipcode": "12926-3874"
        },
        "id": 1,
        "email": "john@gmail.com",
        "username": "johnd",
        "password": "m38rmF",
        "name": {"firstname": "john", "lastname": "doe"},
        "phone": "1-570-236-7033",
        "__v": 0
      },
    ];

    test('should return List<UserModel> on success', () async {
      when(mockDio.get('/users')).thenAnswer(
        (_) async => Response(
          data: mockResponse,
          statusCode: HttpStatus.ok,
          requestOptions: RequestOptions(path: '/users'),
        ),
      );

      final result = await remoteDataSource.getUsers();

      expect(result, isA<ApiResponse<List<UserModel>>>());
      expect(result.data, isNotNull);
      expect(result.data!.first.id, 1);
    });
  });
}
