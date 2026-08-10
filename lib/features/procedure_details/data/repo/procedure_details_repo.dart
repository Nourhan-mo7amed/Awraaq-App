import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';

abstract class ProcedureDetailsRepo {
  Future<ProcedureDetailsModel> getProcedureDetails(dynamic id);
}
