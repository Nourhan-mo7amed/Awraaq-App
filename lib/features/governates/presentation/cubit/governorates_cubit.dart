import 'package:awraq/features/governates/data/repo/governorates_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'governorates_state.dart';

class GovernoratesCubit extends Cubit<GovernoratesState> {
  final GovernoratesRepo repo;

  GovernoratesCubit({
    required this.repo,
  }) : super(GovernoratesInitial());

  Future<void> getGovernorates() async {
    emit(GovernoratesLoading());

    try {
      final response = await repo.getGovernorates();

      emit(
        GovernoratesSuccess(response.data),
      );
    } catch (e) {
      emit(
        GovernoratesFailure(e.toString()),
      );
    }
  }
}