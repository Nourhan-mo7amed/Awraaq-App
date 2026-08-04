class UserModel {
  final String fullName;
  final String email;
  final String phone;
  final String governorate;
  final String image;

  UserModel({
    required this.fullName,
    required this.email,
    required this.phone,
    required this.governorate,
    required this.image,
  });

  UserModel copyWith({
    String? fullName,
    String? email,
    String? phone,
    String? governorate,
    String? image,
  }) {
    return UserModel(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      governorate: governorate ?? this.governorate,
      image: image ?? this.image,
    );
  }
}