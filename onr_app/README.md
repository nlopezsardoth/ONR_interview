# ONR App

A modular Flutter application following Clean Architecture principles. The app consists of three main features:

- **Products**: Fetches and displays product information from FakeStore API.
- **Users**: Fetches and displays user information.
- **Authentication**: Handles user login/logout functionality.

## Features

- **State Management**: BLoC (Business Logic Component)
- **Networking**: Dio for API requests
- **Dependency Injection**: Manual DI
- **Navigation**: GoRouter
- **Form Validation**: Formz
- **Localization**: Intl
- **UI Enhancements**: Shimmer, Animate_do

## Project Architecture

This project follows the **Clean Architecture** approach, splitting the code into three layers:

```
lib/
│── features/
│   ├── auth/             # Authentication Module
│   ├── products/         # Product Module
│   ├── users/            # User Module
│   ├── shared/           # Shared utilities (networking, errors, UI, etc.)
│── main.dart             # Entry point of the app
```

### **1. Data Layer**
- Handles API requests and data storage.
- Uses **Dio** for network requests.
- Repositories fetch data from the API and return a `ResultFuture<T>` (i.e., `Future<Either<Failure, T>>`).
- Implements **models** and **data sources**.

Example:
```dart
class RemoteDataSourceImpl implements RemoteDataSource {
  final Dio _dio;
  
  RemoteDataSourceImpl({Dio? dio}) 
      : _dio = dio ?? Dio(BaseOptions(baseUrl: "https://fakestoreapi.com"));

  @override
  Future<ApiResponse<List<ProductModel>>> getProducts() async {
    final result = await _dio.get('/products');
    return ApiResponse.success(parseProducts(result.data));
  }
}
```

### **2. Domain Layer**
- Contains business logic, **use cases**, and **entities**.
- Implements dependency inversion through repository abstractions.

Example Use Case:
```dart
class GetProductsUseCase extends FutureUseCase<List<Product>, NoParams> {
  final ProductRepository repository;

  GetProductsUseCase(this.repository);

  @override
  ResultFuture<List<Product>> call(NoParams params) {
    return repository.getProducts();
  }
}
```

### **3. Presentation Layer**
- UI components and state management using **Bloc**.
- Uses `flutter_bloc` for reactive UI updates.
- Implements screens and widgets for products, users, and authentication.

Example BLoC:
```dart
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductsUseCase getProductsUseCase;

  ProductBloc(this.getProductsUseCase) : super(ProductInitial()) {
    on<LoadProducts>((event, emit) async {
      emit(ProductLoading());
      final result = await getProductsUseCase(NoParams());
      result.fold(
        (failure) => emit(ProductError(failure.message)),
        (products) => emit(ProductLoaded(products)),
      );
    });
  }
}
```

---

## Setup & Installation

### **1. Clone the Repository**
```sh
git clone https://github.com/your-repo/onr_app.git
cd onr_app
```

### **2. Install Dependencies**
```sh
flutter pub get
```

### **3. Generate Code (Models, Mock Tests, etc.)**
```sh
flutter pub run build_runner build --delete-conflicting-outputs
```

### **4. Run the App**
```sh
flutter run
```

---

## Dependencies Used

### **Core Dependencies**
```yaml
dependencies:
  flutter:
    sdk: flutter
  bloc: ^9.0.0
  flutter_bloc: ^9.1.0
  go_router: ^14.8.1
  dio: ^5.8.0+1
  dartz: ^0.10.1
  formz: ^0.8.0
  intl: ^0.19.0
  json_annotation: ^4.9.0
  provider: ^6.1.2
  animate_do: ^4.2.0
  shimmer: ^3.0.0
  loader_overlay: ^5.0.0
  loading_animation_widget: ^1.3.0
  flutter_localizations:
    sdk: flutter
```

### **Development Dependencies**
```yaml
dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^5.0.0
  build_runner: ^2.4.15
  json_serializable: ^6.9.4
  mockito: ^5.4.5
  bloc_test: ^10.0.0
  envied_generator: ^1.1.1
```

---

## Testing

To run all tests:
```sh
flutter test
```

To run specific tests:
```sh
flutter test test/features/products/domain/usecases/get_products_use_case_test.dart
```

---

## Notes

- **Authentication** is handled via `AuthBloc`.
- **Users** screen displays a popup with the total number of users when entering.
- **Error Handling** is managed via `ErrorBottomSheetStatusMixin`.

This project follows a structured approach to ensure **scalability**, **maintainability**, and **testability**. 🚀
