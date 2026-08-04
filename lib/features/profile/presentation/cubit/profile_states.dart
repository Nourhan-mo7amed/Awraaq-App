import 'package:awraq/features/profile/data/model/profile_model.dart';

abstract class ProfileState {}

class ProfileInitial extends ProfileState {}

class ProfileLoading extends ProfileState {}

class ProfileSuccess extends ProfileState {
  final ProfileModel profile;

  ProfileSuccess(this.profile);
}

class ProfileFailure extends ProfileState {
  final String error;

  ProfileFailure(this.error);
}