import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:awraq/features/location_details/data/repo/location_details_repo.dart';
import 'package:awraq/features/location_details/presentation/cubit/location_details_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocationDetailsCubit extends Cubit<LocationDetailsState> {
  final LocationDetailsRepo repo;

  LocationDetailsCubit(this.repo) : super(LocationDetailsInitial());

  LocationDetailsModel? locationDetails;

  void setLocationDetails(LocationDetailsModel location) {
    locationDetails = location;
    emit(LocationDetailsSuccess(location));
  }

  Future<void> getLocationDetails(dynamic id) async {
    emit(LocationDetailsLoading());

    try {
      locationDetails = await repo.getLocationDetails(id);
      emit(LocationDetailsSuccess(locationDetails!));
    } catch (e) {
      emit(LocationDetailsFailure(e.toString()));
    }
  }
}
