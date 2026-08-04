import 'package:awraq/core/api/api_consumer.dart';
import 'package:awraq/core/api/end_points.dart';
import 'package:awraq/features/profile/data/model/profile_model.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;

  ProfileRepoImpl({required this.api});

  @override
  Future<ProfileModel> getProfile() async {
    final response = await api.get(
      path: EndPoints.profile,
      data: null,
    );
    print(response);
    return ProfileModel.fromJson(response);
  }

  @override
  Future<ProfileModel> updateProfile(
    ProfileModel model,
  ) async {
    final response = await api.patch(
      path: EndPoints.profile,
      data: model.toJson(),
    );

    return ProfileModel.fromJson(response);
  }

  @override
  Future<String> deleteAvatar() async {
    final response = await api.delete(
      path: EndPoints.deleteAvatar,
      data: null,
    );

    return response["message"];
  }

  @override
  Future<String> deleteAccount() async {
    final response = await api.delete(
      path: EndPoints.profile,
      data: null,
    );

    return response["message"];
  }
}
