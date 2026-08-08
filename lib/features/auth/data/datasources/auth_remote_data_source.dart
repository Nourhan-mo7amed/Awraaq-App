import 'package:awraq/core/api/end_points.dart';
import 'package:dio/dio.dart';

import '../models/auth_response.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponse> login({
    required String email,
    required String password,
  });

  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  });

  Future<AuthResponse> sendForgotPasswordOtp({
    required String email,
  });

  Future<AuthResponse> verifyOtp({
    required String otp,
  });

  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  });

  Future<AuthResponse> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl(this.dio);

  final Dio dio;

  @override
  Future<AuthResponse> login({
    required String email,
    required String password,
  }) async {
    final response = await dio.post(
      EndPoints.login,
      data: {
        'email': email,
        'password': password,
      },
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> register({
    required String fullName,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) async {
    final formData = FormData.fromMap({
      'name': fullName,
      'email': email,
      'password': password,
      'password_confirmation': confirmPassword,

      // phone optional
      if (phone.isNotEmpty) 'phone': phone,
    });

    final response = await dio.post(
      EndPoints.register,
      data: formData,
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> sendForgotPasswordOtp({
    required String email,
  }) async {
    final response = await dio.post(
      EndPoints.forgotPassword,
      data: {
        'email': email,
      },
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> verifyOtp({
    required String otp,
  }) async {
    final response = await dio.post(
      EndPoints.verifyOtp,
      data: {
        'otp': otp,
      },
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    final response = await dio.post(
      EndPoints.resetPassword,
      data: {
        'password': password,
        'confirm_password': confirmPassword,
      },
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  @override
  Future<AuthResponse> logout() async {
    final response = await dio.post(
      EndPoints.logout,
    );

    return AuthResponse.fromJson(_asMap(response.data));
  }

  Map<String, dynamic> _asMap(dynamic data) {
    if (data is Map<String, dynamic>) {
      return data;
    }

    return {
      'data': data,
    };
  }
}
// import 'package:awraq/core/api/end_points.dart';
// import 'package:dio/dio.dart';
// import '../models/auth_response.dart';

// abstract class AuthRemoteDataSource {
//   Future<AuthResponse> login({required String email, required String password});

//   Future<AuthResponse> register({
//     required String fullName,
//     required String email,
//     required String phone,
//     required String password,
//   });

//   Future<AuthResponse> sendForgotPasswordOtp({required String email});

//   Future<AuthResponse> verifyOtp({required String otp});

//   Future<AuthResponse> resetPassword({
//     required String password,
//     required String confirmPassword,
//   });

//   Future<AuthResponse> logout();
// }

// class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
//   AuthRemoteDataSourceImpl(this.dio);

//   final Dio dio;

//   @override
//   Future<AuthResponse> login({
//     required String email,
//     required String password,
//   }) async {
//     final response = await dio.post(
//       EndPoints.login,
//       data: <String, dynamic>{'email': email, 'password': password},
//     );

//     return AuthResponse.fromJson(_asMap(response.data));
//   }

//   @override
//   Future<AuthResponse> register({
//     required String fullName,
//     required String email,
//     required String phone,
//     required String password,

//   }) async {
//     final response = await dio.post(
//       EndPoints.register,
//       data: <String, dynamic>{
//         'name': fullName,
//         'email': email,
//         'phone': phone,
//         'password': password,
//        // 'government': government,
//       },
//     );

//     return AuthResponse.fromJson(_asMap(response.data));
//   }

//   @override
//   Future<AuthResponse> sendForgotPasswordOtp({required String email}) async {
//     final response = await dio.post(
//      EndPoints.forgotPassword,
//       data: <String, dynamic>{'email': email},
//     );

//     return AuthResponse.fromJson(_asMap(response.data));
//   }

//   @override
//   Future<AuthResponse> verifyOtp({required String otp}) async {
//     final response = await dio.post(
//       EndPoints.verifyOtp,
//       data: <String, dynamic>{'otp': otp},
//     );

//     return AuthResponse.fromJson(_asMap(response.data));
//   }

//   @override
//   Future<AuthResponse> resetPassword({
//     required String password,
//     required String confirmPassword,
//   }) async {
//     final response = await dio.post(
//       EndPoints.resetPassword,
//       data: <String, dynamic>{
//         'password': password,
//         'confirm_password': confirmPassword,
//       },
//     );

//     return AuthResponse.fromJson(_asMap(response.data));
//   }

//   @override
//   Future<AuthResponse> logout() async {
//     final response = await dio.post(EndPoints.logout);
//     return AuthResponse.fromJson(_asMap(response.data));
//   }

//   Map<String, dynamic> _asMap(dynamic data) {
//     if (data is Map<String, dynamic>) {
//       return data;
//     }

//     return <String, dynamic>{'data': data};
//   }
// }
