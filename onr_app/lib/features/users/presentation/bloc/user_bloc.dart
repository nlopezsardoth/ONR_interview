import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:onr_app/features/shared/utils/ui_utils/overlay/error_bottom_sheet_model.dart';
import 'package:onr_app/features/users/data/repositories/user_repository_impl.dart';
import 'package:onr_app/features/users/domain/entities/user.dart';
import 'package:onr_app/features/users/domain/usecases/get_users_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState>
    with ErrorBottomSheetStatusMixin {
  final GetUsersUseCase _getUsersUseCase;

  UserBloc({GetUsersUseCase? getUsersUseCase})
      : _getUsersUseCase =
            getUsersUseCase ?? GetUsersUseCase(UserRepositoryImpl()),
        super(const UserState()) {
    on<LoadUsers>(_onLoadUsers);
  }

  Future<void> _onLoadUsers(LoadUsers event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: UserStatus.loading));

    final result = await _getUsersUseCase.call(unit);

    result.fold(
      (failure) {
        emit(state.copyWith(status: UserStatus.failure));
        errorBottomSheetStatus.postCantLoadUsersError();
      },
      (users) => emit(state.copyWith(status: UserStatus.success, users: users)),
    );
  }
}
