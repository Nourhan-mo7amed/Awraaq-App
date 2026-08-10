import 'package:awraq/features/profile/data/model/profile_model.dart';

abstract class ProfileRepo {
  Future<ProfileModel> getProfile();

  Future<ProfileModel> updateProfile(
    ProfileModel model,
  );

  Future<String> deleteAvatar();

  Future<String> deleteAccount();
}
