import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

import '../presentation/cubit/auth_status.dart';
import '../presentation/cubit/otp_cubit.dart';
import '../presentation/cubit/otp_state.dart';
import 'login_button.dart';

class OtpForm extends StatelessWidget {
  const OtpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OtpCubit>();

    return BlocBuilder<OtpCubit, OtpState>(
      builder: (context, state) {
        return Column(
          children: [
            Pinput(
              controller: cubit.pinController,
              length: 6,
              onChanged: (_) => cubit.onChanged(),
            ),

            if (state.status == AuthStatus.failure)
              const Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "This is incorrect OTP",
                    style: TextStyle(color: Colors.red, fontSize: 12),
                  ),
                ),
              ),

            const SizedBox(height: 25),

            LoginButton(
              title: state.isLoading ? "Verifying..." : "Verify",
              enabled: cubit.enableButton && !state.isLoading,
              onPressed: cubit.verifyOtp,
            ),

            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Didn't receive the code ? "),

                GestureDetector(
                  onTap: () {},
                  child: const Text(
                    "Resend",
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
