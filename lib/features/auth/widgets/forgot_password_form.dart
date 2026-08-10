import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/utils/app_validations.dart';
import '../presentation/cubit/forgot_password_cubit.dart';
import '../presentation/cubit/forgot_password_state.dart';
import 'login_button.dart';
import 'login_text_field.dart';

class ForgotPasswordForm extends StatelessWidget {
  const ForgotPasswordForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<ForgotPasswordCubit>();

    return BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
      builder: (context, state) {
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [
              LoginTextField(
                controller: cubit.emailController,
                label: "Email Address",
                hint: "email@mail.com",
                icon: Icons.email_outlined,
                keyboardType: TextInputType.emailAddress,
                validator: (value) => AppValidator.email(value ?? ''),
                onChanged: (_) => cubit.onChanged(),
              ),

              const SizedBox(height: 30),

              LoginButton(
                title: state.isLoading ? "Sending..." : "Sent OTP",
                enabled: cubit.enableButton && !state.isLoading,
                onPressed: cubit.sendOtp,
              ),
            ],
          ),
        );
      },
    );
  }
}
