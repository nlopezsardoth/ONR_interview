import 'package:onr_app/features/shared/utils/typedefs.dart';
import 'package:onr_app/features/auth/domain/entities/auth_user.dart';
import 'package:onr_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:onr_app/features/shared/domain/usecases/generic_use_cases.dart';

class LoginUseCase extends FutureUseCase<AuthUser, (String, String)> {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  @override
  ResultFuture<AuthUser> call((String, String) input) {
    return repository.login(input.$1, input.$2);
  }
}