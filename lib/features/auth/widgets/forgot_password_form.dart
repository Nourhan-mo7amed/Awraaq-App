import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/forgot_password_controller.dart';
import 'login_button.dart';
import 'login_text_field.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ForgotPasswordController>();

    return Form(
      key: controller.formKey,
      child: Column(
        children: [

          LoginTextField(
            controller: controller.emailController,
            label: "Email Address",
            hint: "email@mail.com",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) => controller.onChanged(),
          ),

          const SizedBox(height: 30),

          LoginButton(
            title: "Sent OTP",
            enabled: controller.enableButton,
            onPressed: () {
  controller.sendOtp(context);
}
          ),
        ],
      ),
    );
  }
}