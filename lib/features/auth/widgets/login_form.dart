// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../core/utils/app_validations.dart';
import '../presentation/cubit/auth_status.dart';
import '../presentation/cubit/login_cubit.dart';
import '../presentation/cubit/login_state.dart';
import '../screen/forgot_password_screen.dart';
import 'login_button.dart';
import 'login_text_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<LoginCubit>();

    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state.status == AuthStatus.success) {
          context.go(AppRoutes.layout);
        }
      },
      child: BlocBuilder<LoginCubit, LoginState>(
        builder: (context, state) {
          return Form(
            key: cubit.formKey,
            child: Column(
              children: [
                LoginTextField(
                  controller: cubit.emailController,
                  label: "Email Address",
                  hint: "Enter your email",
                  icon: Icons.email_outlined,
                  validator: (value) =>
                      AppValidator.email(value ?? ''),
                  onChanged: cubit.emailChanged,
                ),

                const SizedBox(height: 20),

                LoginTextField(
                  controller: cubit.passwordController,
                  label: "Password",
                  hint: "Enter your password",
                  icon: Icons.lock_outline,
                  isPassword: true,
                  obscureText: state.obscurePassword,
                  onToggle: cubit.togglePassword,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Password is required';
                    }

                    return null;
                  },
                  onChanged: cubit.passwordChanged,
                  errorText: state.passwordErrorText,
                ),

                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      context.push(AppRoutes.forgotPassword);
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
                  title: state.isLoading
                      ? "Signing In..."
                      : "Sign In",
                  enabled: cubit.isValid && !state.isLoading,
                  onPressed: cubit.login,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}