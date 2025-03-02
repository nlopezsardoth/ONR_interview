import 'package:mockito/annotations.dart';
import 'package:onr_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:onr_app/features/auth/domain/usecases/logout_usecase.dart';

@GenerateMocks([LoginUseCase, LogoutUseCase])
class RepositoriesMockHelper {}
