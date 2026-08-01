import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../data/auth_dependencies.dart';
import '../presentation/cubit/auth_status.dart';
import '../presentation/cubit/otp_cubit.dart';
import '../presentation/cubit/otp_state.dart';
import '../widgets/otp_form.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OtpCubit(buildAuthRepository()),
      child: BlocListener<OtpCubit, OtpState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.go(AppRoutes.resetPassword);
          }

          if (state.status == AuthStatus.failure && state.message != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        child: const _OtpView(),
      ),
    );
  }
}

class _OtpView extends StatelessWidget {
  const _OtpView();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 10),

                Align(
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Icon(Icons.arrow_back_ios_new, size: 18),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: const Color(0xffEAF2FF),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Icon(
                    Icons.mail_outline,
                    size: 36,
                    color: Color(0xff2F80ED),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "OTP Verification",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28),
                ),

                const SizedBox(height: 10),

                const Text(
                  "We sent 6 digit code to your email address\nplease check & enter your code",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, height: 1.5),
                ),

                const SizedBox(height: 40),

                const OtpForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
