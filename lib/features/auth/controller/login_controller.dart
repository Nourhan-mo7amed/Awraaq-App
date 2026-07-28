import 'package:flutter/material.dart';

import '../../../core/utils/app_validations.dart';

class LoginController extends ChangeNotifier {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool obscure = true;

  bool wrongPassword = false;

  bool get isValid =>
      AppValidator.email(emailController.text) == null &&
      AppValidator.password(passwordController.text) == null;

  void change() {
    notifyListeners();
  }

  void togglePassword() {
    obscure = !obscure;
    notifyListeners();
  }

  void login() {
    if (passwordController.text != "12345678") {
      wrongPassword = true;
    } else {
      wrongPassword = false;
    }

    notifyListeners();
  }
}