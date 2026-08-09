import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/end_points.dart';
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:awraq/features/location_details/data/repo/location_details_repo.dart';

class LocationDetailsRepoImpl implements LocationDetailsRepo {
  final ApiConsumer api;

  LocationDetailsRepoImpl({
    required this.api,
  });

  @override
  Future<LocationDetailsModel> getLocationDetails(dynamic id) async {
    final response = await api.get(
      path: '${EndPoints.locationDetails}$id',
      data: null,
    );

    if (response is Map<String, dynamic> && response.containsKey("data") && response["data"] != null) {
      return LocationDetailsModel.fromJson(response["data"] as Map<String, dynamic>);
    }
    return LocationDetailsModel.fromJson(response as Map<String, dynamic>);
  }
}
