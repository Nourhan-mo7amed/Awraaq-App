import 'package:flutter/material.dart';

class RegisterController extends ChangeNotifier {
  final formKey = GlobalKey<FormState>();

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final fullNameFocus = FocusNode();
  final emailFocus = FocusNode();
  final phoneFocus = FocusNode();
  final passwordFocus = FocusNode();
  final confirmPasswordFocus = FocusNode();

  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  bool agreeTerms = false;

  bool passwordError = false;
  bool confirmPasswordError = false;

  bool get enableButton =>
      fullNameController.text.isNotEmpty &&
      emailController.text.isNotEmpty &&
      phoneController.text.isNotEmpty &&
      passwordController.text.isNotEmpty &&
      confirmPasswordController.text.isNotEmpty &&
      agreeTerms;

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

  void changeAgree(bool value) {
    agreeTerms = value;
    notifyListeners();
  }

  double get strength {
    final password = passwordController.text;

    if (password.length < 6) return .25;

    bool upper = password.contains(RegExp(r'[A-Z]'));
    bool lower = password.contains(RegExp(r'[a-z]'));
    bool number = password.contains(RegExp(r'[0-9]'));
    bool symbol =
        password.contains(RegExp(r'[!@#\$%^&*(),.?":{}|<>]'));

    int score = 0;

    if (upper) score++;
    if (lower) score++;
    if (number) score++;
    if (symbol) score++;

    return score / 4;
  }

  void register() {
    if (!formKey.currentState!.validate()) return;

    if (passwordController.text.length < 8) {
      passwordError = true;
      notifyListeners();
      return;
    }

    if (passwordController.text !=
        confirmPasswordController.text) {
      confirmPasswordError = true;
      notifyListeners();
      return;
    }

    debugPrint("Register Success");
  }

  @override
  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    fullNameFocus.dispose();
    emailFocus.dispose();
    phoneFocus.dispose();
    passwordFocus.dispose();
    confirmPasswordFocus.dispose();

    super.dispose();
  }
}