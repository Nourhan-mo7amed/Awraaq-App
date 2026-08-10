import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/end_points.dart';
import 'package:awraq/features/procedure_details/data/models/procedure_details_model.dart';
import 'package:awraq/features/procedure_details/data/repo/procedure_details_repo.dart';

class ProcedureDetailsRepoImpl implements ProcedureDetailsRepo {
  final ApiConsumer api;

  ProcedureDetailsRepoImpl({
    required this.api,
  });

  @override
  Future<ProcedureDetailsModel> getProcedureDetails(dynamic id) async {
    final response = await api.get(
      path: '${EndPoints.procedureDetails}$id',
      data: null,
    );

    if (response is Map<String, dynamic> && response.containsKey("data") && response["data"] != null) {
      return ProcedureDetailsModel.fromJson(response["data"] as Map<String, dynamic>);
    }
    return ProcedureDetailsModel.fromJson(response as Map<String, dynamic>);
  }
}
