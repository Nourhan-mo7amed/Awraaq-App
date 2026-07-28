
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'login_button.dart';
import 'login_text_field.dart';
import '../controller/reset_password_controller.dart';
import 'password_strength.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ResetPasswordController>();

    return Form(
      key: controller.formKey,
      child: Column(
        children: [
          LoginTextField(
            controller: controller.passwordController,
            label: "Password",
            hint: "Create a strong password",
            icon: Icons.lock_outline,
            isPassword: true,
            obscureText: controller.obscurePassword,
            onToggle: controller.togglePassword,
            onChanged: (_) => controller.onChanged(),
            errorText: controller.passwordError
                ? "This password isn't strong."
                : null,
          ),

          const SizedBox(height: 10),

          PasswordStrength(strength: controller.strength),

          const SizedBox(height: 20),

          LoginTextField(
            controller: controller.confirmPasswordController,
            label: "Confirm Password",
            hint: "Confirm your password",
            icon: Icons.lock_outline,
            isPassword: true,
            obscureText: controller.obscureConfirmPassword,
            onToggle: controller.toggleConfirmPassword,
            onChanged: (_) => controller.onChanged(),
            errorText: controller.confirmPasswordError
                ? "Passwords do not match."
                : null,
          ),

          const SizedBox(height: 30),
LoginButton(
  title: "Reset",
  enabled: controller.enableButton,
  onPressed: () {
    controller.resetPassword(context);
  },
),
        ],
      ),
    );
  }
}
