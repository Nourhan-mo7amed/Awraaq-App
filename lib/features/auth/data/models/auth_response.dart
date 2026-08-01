class AuthResponse {
  const AuthResponse({this.accessToken, this.message, this.raw});

  final String? accessToken;
  final String? message;
  final Map<String, dynamic>? raw;

  factory AuthResponse.fromJson(Map<String, dynamic> json) {
    return AuthResponse(
      accessToken: _readToken(json),
      message: _readMessage(json),
      raw: json,
    );
  }

  static String? _readToken(Map<String, dynamic> json) {
    final directToken = json['access_token'] ?? json['token'];
    if (directToken is String && directToken.isNotEmpty) {
      return directToken;
    }

    final data = json['data'];
    if (data is Map<String, dynamic>) {
      final nestedToken = data['access_token'] ?? data['token'];
      if (nestedToken is String && nestedToken.isNotEmpty) {
        return nestedToken;
      }
    }

    return null;
  }

  static String? _readMessage(Map<String, dynamic> json) {
    final message = json['message'] ?? json['msg'] ?? json['error'];
    if (message is String && message.isNotEmpty) {
      return message;
    }

    final data = json['data'];
    if (data is Map<String, dynamic>) {
      final nestedMessage = data['message'] ?? data['msg'];
      if (nestedMessage is String && nestedMessage.isNotEmpty) {
        return nestedMessage;
      }
    }

    return null;
  }
}
