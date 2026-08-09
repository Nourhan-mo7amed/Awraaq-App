// class ProfileModel {
//   final String message;
//   final UserData data;

//   ProfileModel({
//     required this.message,
//     required this.data,
//   });

//   factory ProfileModel.fromJson(Map<String, dynamic> json) {
//     return ProfileModel(
//       message: json['message'],
//       data: UserData.fromJson(json['data']),
//     );
//   }
//      Map<String, dynamic> toJson() {
//     return data.toJson();
//   }
//   }

// class UserData {
//   final int id;
//   final String name;
//   final String email;
//   final String phone;
//   final String governorate;
//   final String avatar;

//   UserData({
//     required this.id,
//     required this.name,
//     required this.email,
//     required this.phone,
//     required this.governorate,
//     required this.avatar,
//   });

//   factory UserData.fromJson(Map<String, dynamic> json) {
//     return UserData(
//       id: json['id'],
//       name: json['name'],
//       email: json['email'],
//       phone: json['phone'],
//       governorate: json['governorate'],
//       avatar: json['avatar'],
//     );
//   }
//    Map<String, dynamic> toJson() {
//     return {
//       "name": name,
//       "email": email,
//       "phone": phone,
//       "governorate": governorate,
//       "avatar": avatar,
//     };
//   }
// }
class ProfileModel {
  final String message;
  final UserData data;

  ProfileModel({
    required this.message,
    required this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      message: json['message'] ?? '',
      data: UserData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return data.toJson();
  }
}

class UserData {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String governorate;
  final String? avatar;

  UserData({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.governorate,
    this.avatar,
  });

  factory UserData.fromJson(Map<String, dynamic> json) {
    return UserData(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      governorate: json['governorate'] ?? '',
      avatar: json['avatar'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "governorate": governorate,
      "avatar": avatar,
    };
  }
}