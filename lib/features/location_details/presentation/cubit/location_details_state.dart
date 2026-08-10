import 'package:awraq/features/location_details/data/models/location_details_model.dart';

abstract class LocationDetailsState {}

class LocationDetailsInitial extends LocationDetailsState {}

class LocationDetailsLoading extends LocationDetailsState {}

class LocationDetailsSuccess extends LocationDetailsState {
  final LocationDetailsModel locationDetails;

  LocationDetailsSuccess(this.locationDetails);
}

class LocationDetailsFailure extends LocationDetailsState {
  final String error;

  LocationDetailsFailure(this.error);
}
