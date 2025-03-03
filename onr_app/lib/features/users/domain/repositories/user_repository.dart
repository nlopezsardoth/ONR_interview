import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';

abstract class UserRepository {
  ResultFuture<List<User>> getUsers();
}
