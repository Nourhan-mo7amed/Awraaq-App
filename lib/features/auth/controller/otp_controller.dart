import 'package:flutter/material.dart';

import '../screen/reset_password_screen.dart';

class OtpController extends ChangeNotifier {
  final pinController = TextEditingController();

  bool wrongOtp = false;

  bool get enableButton => pinController.text.length == 6;

  void onChanged() {
    wrongOtp = false;
    notifyListeners();
  }

  void verifyOtp(BuildContext context) {
    if (pinController.text != "123456") {
      wrongOtp = true;
      notifyListeners();
      return;
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const ResetPasswordScreen()),
    );
  }

  @override
  void dispose() {
    pinController.dispose();
    super.dispose();
  }
}
