import 'package:awraq/features/location_details/data/models/location_details_model.dart';

abstract class LocationDetailsRepo {
  Future<LocationDetailsModel> getLocationDetails(dynamic id);
}
