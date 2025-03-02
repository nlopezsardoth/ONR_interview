import 'package:dartz/dartz.dart';
import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:onr_app/features/shared/domain/usecases/generic_use_cases.dart';

class LogoutUseCase extends FutureUseCase<Unit, Unit> {
  final AuthRepository repository;

  LogoutUseCase(this.repository);

  @override
  ResultFuture<Unit> call(Unit noParams) {
    return repository.logout();
  }
}