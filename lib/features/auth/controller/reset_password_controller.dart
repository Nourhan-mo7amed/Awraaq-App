import 'package:flutter/material.dart';

import '../screen/success_screen.dart';

class ResetPasswordController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool passwordError = false;
  bool confirmPasswordError = false;

  bool get enableButton =>
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty;

  void onChanged() {
    passwordError = false;
    confirmPasswordError = false;
    notifyListeners();
  }

  void togglePassword() {
    obscurePassword = !obscurePassword;
    notifyListeners();
  }

  void toggleConfirmPassword() {
    obscureConfirmPassword = !obscureConfirmPassword;
    notifyListeners();
  }

  double get strength {
    final password = passwordController.text;

    if (password.length < 6) return .25;

    bool upper = password.contains(RegExp(r'[A-Z]'));
    bool lower = password.contains(RegExp(r'[a-z]'));
    bool number = password.contains(RegExp(r'[0-9]'));
    bool symbol = password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    int score = 0;

    if (upper) score++;
    if (lower) score++;
    if (number) score++;
    if (symbol) score++;

    return score / 4;
  }
void resetPassword(BuildContext context) {
  passwordError = false;
  confirmPasswordError = false;

  if (passwordController.text.length < 8) {
    passwordError = true;
    notifyListeners();
    return;
  }

  if (passwordController.text != confirmPasswordController.text) {
    confirmPasswordError = true;
    notifyListeners();
    return;
  }

  Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (_) => const SuccessScreen(),
    ),
  );
}
 
  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
