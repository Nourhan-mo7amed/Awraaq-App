import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_validations.dart';
import '../presentation/cubit/register_cubit.dart';
import '../presentation/cubit/register_state.dart';
import 'login_text_field.dart';
import 'password_strength.dart';
import 'terms_checkbox.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              LoginTextField(
                controller: cubit.fullNameController,
                label: "Full Name",
                hint: "Enter your full name",
                icon: Icons.person_outline,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Full name is required';
                  }

                  return null;
                },
                onChanged: (_) => cubit.onChanged(),
              ),

              const SizedBox(height: 18),

              LoginTextField(
                controller: cubit.emailController,
                label: "Email Address",
                hint: "Enter your email",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => AppValidator.email(value ?? ''),
                onChanged: (_) => cubit.onChanged(),
              ),

              const SizedBox(height: 18),

              LoginTextField(
                controller: cubit.phoneController,
                label: "Phone Number",
                hint: "Enter your phone number",
                icon: Icons.phone_outlined,
                keyboardType: TextInputType.phone,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Phone number is required';
                  }

                  return null;
                },
                onChanged: (_) => cubit.onChanged(),
              ),

              const SizedBox(height: 18),

              LoginTextField(
                controller: cubit.passwordController,
                label: "Password",
                hint: "Create a strong password",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: state.obscurePassword,
                onToggle: cubit.togglePassword,
                validator: (value) => AppValidator.password(value ?? ''),
                onChanged: (_) => cubit.onChanged(),
                errorText: state.passwordErrorText,
              ),

              const SizedBox(height: 10),

              PasswordStrength(strength: cubit.strength),

              const SizedBox(height: 18),

              LoginTextField(
                controller: cubit.confirmPasswordController,
                label: "Confirm Password",
                hint: "Confirm your password",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: state.obscureConfirmPassword,
                onToggle: cubit.toggleConfirmPassword,
                validator: (value) => AppValidator.password(value ?? ''),
                onChanged: (_) => cubit.onChanged(),
                errorText: state.confirmPasswordErrorText,
              ),

              const SizedBox(height: 20),

              TermsCheckbox(
                value: state.agreeTerms,
                onChanged: cubit.changeAgree,
              ),
            ],
          ),
        );
      },
    );
  }
}
