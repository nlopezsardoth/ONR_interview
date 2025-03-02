import 'package:mockito/annotations.dart';
import 'package:onr_app/features/auth/presentation/blocs/auth/auth_bloc.dart';
import 'package:onr_app/features/auth/presentation/blocs/login/login_bloc.dart';

@GenerateMocks([AuthBloc, LoginBloc])
class BlocsMockHelper {}