import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controller/register_controller.dart';
import 'password_strength.dart';
import 'terms_checkbox.dart';

import 'login_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<RegisterController>();

    return Form(
      key: controller.formKey,
      child: Column(
        children: [

          LoginTextField(
            controller: controller.fullNameController,
            label: "Full Name",
            hint: "Enter your full name",
            icon: Icons.person_outline,
            onChanged: (_) => controller.onChanged(),
          ),

          const SizedBox(height: 18),

          LoginTextField(
            controller: controller.emailController,
            label: "Email Address",
            hint: "Enter your email",
            icon: Icons.email_outlined,
            keyboardType: TextInputType.emailAddress,
            onChanged: (_) => controller.onChanged(),
          ),

          const SizedBox(height: 18),

          LoginTextField(
            controller: controller.phoneController,
            label: "Phone Number",
            hint: "Enter your phone number",
            icon: Icons.phone_outlined,
            keyboardType: TextInputType.phone,
            onChanged: (_) => controller.onChanged(),
          ),

          const SizedBox(height: 18),

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

          PasswordStrength(
            strength: controller.strength,
          ),

          const SizedBox(height: 18),

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

          const SizedBox(height: 20),

          TermsCheckbox(
            value: controller.agreeTerms,
            onChanged: controller.changeAgree,
          ),
        ],
      ),
    );
  }
}