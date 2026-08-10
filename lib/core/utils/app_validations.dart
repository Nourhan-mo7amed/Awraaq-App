class AppValidator {
  AppValidator._();

  static String? email(String value) {
    if (value.isEmpty) {
      return "Email is required";
    }

    final emailRegex =
        RegExp(r'^[^@]+@[^@]+\.[^@]+');

    if (!emailRegex.hasMatch(value)) {
      return "Invalid email";
    }

    return null;
  }

  static String? password(String value) {
    if (value.isEmpty) {
      return "Password is required";
    }

    if (value.length < 8) {
      return "Password must be at least 8 characters";
    }

    return null;
  }
}