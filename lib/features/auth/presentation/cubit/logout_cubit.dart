import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/auth_repository.dart';
import 'auth_status.dart';
import 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutCubit(this._repository) : super(const LogoutState());

  final AuthRepository _repository;

  Future<void> logout() async {
    emit(const LogoutState(status: AuthStatus.loading));

    try {
      await _repository.logout();
      emit(const LogoutState(status: AuthStatus.success));
    } catch (error) {
      emit(LogoutState(status: AuthStatus.failure, message: error.toString()));
    }
  }
}
