import 'package:awraq/features/profile/presentation/cubit/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';


class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo repo;

  ProfileCubit({
    required this.repo,
  }) : super(ProfileInitial());

  Future<void> getProfile() async {
    emit(ProfileLoading());

    try {
      final profile = await repo.getProfile();

      emit(ProfileSuccess(profile));
    } catch (e) {
      emit(ProfileFailure(e.toString()));
    }
  }
}