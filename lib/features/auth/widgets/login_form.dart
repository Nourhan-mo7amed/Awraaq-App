import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/login_controller.dart';
import '../screen/forgot_password_screen.dart';
import 'login_button.dart';
import 'login_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<LoginController>();

    return Column(
      children: [
        LoginTextField(
          controller: controller.emailController,
          label: "Email Address",
          hint: "Enter your email",
          icon: Icons.email_outlined,
          onChanged: (_) => controller.change(),
        ),

        const SizedBox(height: 20),

        LoginTextField(
          controller: controller.passwordController,
          label: "Password",
          hint: "Enter your password",
          icon: Icons.lock_outline,
          isPassword: true,
          obscureText: controller.obscure,
          onToggle: controller.togglePassword,
          onChanged: (_) => controller.change(),
          errorText: controller.wrongPassword
              ? "This password is incorrect."
              : null,
        ),

        const SizedBox(height: 10),

        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const ForgotPasswordScreen()),
              );
            },
            child: const Text(
              "Forgot your password?",
              style: TextStyle(
                color: Color(0xff2F80ED),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),

        const SizedBox(height: 24),

        LoginButton(
          title: "Sign In",
          enabled: controller.isValid,
          onPressed: controller.login,
        ),
      ],
    );
  }
}
