import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';
import 'package:onr_app/features/users/domain/repositories/user_repository.dart';
import 'package:onr_app/features/shared/domain/usecases/generic_use_cases.dart';

class GetUsersUseCase extends FutureUseCase<List<User>, Unit> {
  final UserRepository _repository;

  GetUsersUseCase(this._repository);

  @override
  ResultFuture<List<User>> call(Unit noParams) {
    return _repository.getUsers();
  }
}
