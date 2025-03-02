import 'package:flutter_test/flutter_test.dart';
import 'package:onr_app/features/auth/data/datasources/auth_local_datasource_impl.dart';

void main() {
  late AuthLocalDataSourceImpl dataSource;

  setUp(() {
    dataSource = AuthLocalDataSourceImpl();
  });

  test('should return true when login is called', () async {
    final result = await dataSource.login('test@example.com', 'password123');
    expect(result, true);
  });

  test('should return true when logout is called', () async {
    final result = await dataSource.logout();
    expect(result, true);
  });
}
