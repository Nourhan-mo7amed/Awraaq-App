import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/end_points.dart';
import 'package:awraq/features/governates/data/model/governates_model.dart';
import 'package:awraq/features/governates/data/repo/governorates_repo.dart';

class GovernoratesRepoImpl implements GovernoratesRepo {
  final ApiConsumer api;

  GovernoratesRepoImpl({required this.api});

  @override
  Future<GovernoratesModel> getGovernorates() async {
    final response = await api.get(
      path: EndPoints.governorates,
      data: null,
    );
    print(response);
    return GovernoratesModel.fromJson(response);
  }
}
