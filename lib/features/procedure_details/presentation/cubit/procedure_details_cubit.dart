import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:awraq/features/procedure_details/data/repo/procedure_details_repo.dart';
import 'package:awraq/features/procedure_details/presentation/cubit/procedure_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProcedureDetailsCubit extends Cubit<ProcedureDetailsState> {
  final ProcedureDetailsRepo repo;

  ProcedureDetailsCubit(this.repo) : super(ProcedureDetailsInitial());

  ProcedureDetailsModel? procedureDetails;

  void setProcedureDetails(ProcedureDetailsModel procedure) {
    procedureDetails = procedure;
    emit(ProcedureDetailsSuccess(procedure));
  }

  Future<void> getProcedureDetails(dynamic id) async {
    emit(ProcedureDetailsLoading());

    try {
      procedureDetails = await repo.getProcedureDetails(id);
      emit(ProcedureDetailsSuccess(procedureDetails!));
    } catch (e) {
      emit(ProcedureDetailsFailure(e.toString()));
    }
  }
}
