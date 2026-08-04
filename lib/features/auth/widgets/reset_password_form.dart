import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_validations.dart';
import '../presentation/cubit/reset_password_cubit.dart';
import '../presentation/cubit/reset_password_state.dart';
import 'login_button.dart';
import 'login_text_field.dart';
import 'password_strength.dart';

class ResetPasswordForm extends StatelessWidget {
  const ResetPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ResetPasswordCubit>();

    return BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              LoginTextField(
                controller: cubit.passwordController,
                label: "Password",
                hint: "Create a strong password",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: cubit.obscurePassword,
                onToggle: cubit.togglePassword,
                validator: (value) => AppValidator.password(value ?? ''),
                onChanged: (_) => cubit.onChanged(),
                errorText: state.passwordErrorText,
              ),

              const SizedBox(height: 10),

              PasswordStrength(strength: cubit.strength),

              const SizedBox(height: 20),

              LoginTextField(
                controller: cubit.confirmPasswordController,
                label: "Confirm Password",
                hint: "Confirm your password",
                icon: Icons.lock_outline,
                isPassword: true,
                obscureText: cubit.obscureConfirmPassword,
                onToggle: cubit.toggleConfirmPassword,
                validator: (value) => AppValidator.password(value ?? ''),
                onChanged: (_) => cubit.onChanged(),
                errorText: state.confirmPasswordErrorText,
              ),

              const SizedBox(height: 30),
              LoginButton(
                title: state.isLoading ? "Resetting..." : "Reset",
                enabled: cubit.enableButton && !state.isLoading,
                onPressed: cubit.resetPassword,
              ),
            ],
          ),
        );
      },
    );
  }
}
