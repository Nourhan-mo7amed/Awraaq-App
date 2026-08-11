import 'package:dio/dio.dart';

class AuthErrorMapper {
  AuthErrorMapper._();

  static String message(Object error) {
    if (error is DioException) {
      return _fromDio(error);
    }

    return 'An unexpected error occurred. Please try again.';
  }

  static String _fromDio(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        return 'Connection timed out. Please check your internet connection.';
      case DioExceptionType.sendTimeout:
        return 'Request timed out while sending data. Please try again.';
      case DioExceptionType.receiveTimeout:
        return 'The server took too long to respond. Please try again.';
      case DioExceptionType.connectionError:
        return 'Unable to connect to the server. Please check your internet connection.';
      case DioExceptionType.badCertificate:
        return 'Secure connection failed due to an invalid certificate.';
      case DioExceptionType.transformTimeout:
        return 'Failed to process the server response. Please try again.';
      case DioExceptionType.badResponse:
        return _fromResponse(error) ??
            'Server returned an unexpected response.';
      case DioExceptionType.cancel:
        return 'Request was cancelled.';
      case DioExceptionType.unknown:
        final errorText = error.error?.toString() ?? error.message ?? '';

        if (errorText.contains('Failed host lookup')) {
          return 'Unable to reach the server. Please check the API URL.';
        }

        if (errorText.contains('SocketException')) {
          return 'Network error. Please check your internet connection.';
        }

        return 'Something went wrong while connecting to the server.';
    }
  }

  static String? _fromResponse(DioException error) {
    final response = error.response;
    final statusCode = response?.statusCode;
    final data = response?.data;

    final extractedMessage = _extractMessage(data);
    final validationMessage = _extractValidationMessage(data);

    if (validationMessage != null) {
      return validationMessage;
    }

    if (extractedMessage != null && extractedMessage.isNotEmpty) {
      return extractedMessage;
    }

    switch (statusCode) {
      case 400:
      case 422:
        return 'Invalid input. Please check the entered data.';
      case 401:
        return 'Invalid email or password.';
      case 403:
        return 'You do not have permission to perform this action.';
      case 404:
        return 'Requested resource was not found.';
      default:
        if (statusCode != null && statusCode >= 500) {
          return 'Internal server error. Please try again later.';
        }
        return null;
    }
  }

  static String? _extractMessage(dynamic data) {
    if (data is Map<String, dynamic>) {
      final message = data['message'] ?? data['msg'] ?? data['error'];

      if (message is String && message.isNotEmpty) {
        return message;
      }

      final nestedData = data['data'];

      if (nestedData is Map<String, dynamic>) {
        final nestedMessage =
            nestedData['message'] ?? nestedData['msg'] ?? nestedData['error'];

        if (nestedMessage is String && nestedMessage.isNotEmpty) {
          return nestedMessage;
        }
      }
    }

    if (data is String && data.isNotEmpty) {
      return data;
    }

    return null;
  }

  static String? _extractValidationMessage(dynamic data) {
    if (data is! Map<String, dynamic>) {
      return null;
    }

    final errors = data['errors'];

    if (errors is! Map) {
      return null;
    }

    for (final entry in errors.entries) {
      final field = _fieldLabel(entry.key.toString());
      final value = entry.value;

      if (value is List && value.isNotEmpty) {
        final firstError = value.first.toString();
        if (entry.key.toString() == 'email' &&
            (firstError.contains('already been taken') ||
                firstError.contains('unique') ||
                firstError.contains('مستخدم من قبل'))) {
          return 'Email is already registered.';
        }
        return '$field: $firstError';
      }

      if (value is String && value.isNotEmpty) {
        if (entry.key.toString() == 'email' &&
            (value.contains('already been taken') ||
                value.contains('unique') ||
                value.contains('مستخدم من قبل'))) {
          return 'Email is already registered.';
        }
        return '$field: $value';
      }
    }

    return null;
  }

  static String _fieldLabel(String key) {
    switch (key) {
      case 'full_name':
      case 'name':
        return 'Full Name';
      case 'email':
        return 'Email';
      case 'phone':
        return 'Phone Number';
      case 'password':
        return 'Password';
      case 'confirm_password':
      case 'password_confirmation':
        return 'Confirm Password';
      case 'otp':
      case 'code':
        return 'Verification Code';
      default:
        return key;
    }
  }
}
