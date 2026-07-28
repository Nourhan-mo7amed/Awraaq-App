import 'package:flutter/material.dart';

import '../screen/otp_verification_screen.dart';

class ForgotPasswordController extends ChangeNotifier {
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool get enableButton => emailController.text.trim().isNotEmpty;

  void onChanged() {
    notifyListeners();
  }

  void sendOtp(BuildContext context) {
    if (!formKey.currentState!.validate()) return;

    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const OtpScreen()),
    );
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }
}
