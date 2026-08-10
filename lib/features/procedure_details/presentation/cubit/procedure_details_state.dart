import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';

abstract class ProcedureDetailsState {}

class ProcedureDetailsInitial extends ProcedureDetailsState {}

class ProcedureDetailsLoading extends ProcedureDetailsState {}

class ProcedureDetailsSuccess extends ProcedureDetailsState {
  final ProcedureDetailsModel procedureDetails;

  ProcedureDetailsSuccess(this.procedureDetails);
}

class ProcedureDetailsFailure extends ProcedureDetailsState {
  final String error;

  ProcedureDetailsFailure(this.error);
}
