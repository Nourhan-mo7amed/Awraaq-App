import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routing/app_routes.dart';
import '../../../core/theme/app_colors.dart';
import '../data/auth_dependencies.dart';
import '../presentation/cubit/auth_status.dart';
import '../presentation/cubit/register_cubit.dart';
import '../presentation/cubit/register_state.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/language_switch.dart';
import '../widgets/login_button.dart';
import '../widgets/register_form.dart';
import '../widgets/social_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterCubit(buildAuthRepository()),
      child: BlocListener<RegisterCubit, RegisterState>(
        listener: (context, state) {
          if (state.status == AuthStatus.success) {
            context.go(AppRoutes.home);
          }

          if (state.status == AuthStatus.failure && state.message != null) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message!)));
          }
        },
        child: const _RegisterView(),
      ),
    );
  }
}

class _RegisterView extends StatefulWidget {
  const _RegisterView();

  @override
  State<_RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<_RegisterView> {
  bool english = true;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<RegisterCubit>();

    return BlocBuilder<RegisterCubit, RegisterState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.lightBackground,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  const SizedBox(height: 10),

                  Align(
                    alignment: Alignment.centerRight,
                    child: LanguageSwitch(
                      isEnglish: english,
                      onChanged: () {
                        setState(() {
                          english = !english;
                        });
                      },
                    ),
                  ),

                  const SizedBox(height: 35),

                  const AuthHeader(
                    title: "Join Awraq",
                    subtitle: "Create your account to get started",
                  ),

                  const SizedBox(height: 35),

                  const RegisterForm(),

                  const SizedBox(height: 20),

                  LoginButton(
                    title: state.isLoading ? "Creating..." : "Create Account",
                    enabled: cubit.enableButton && !state.isLoading,
                    onPressed: cubit.register,
                  ),

                  const SizedBox(height: 20),

                  Row(
                    children: const [
                      Expanded(child: Divider()),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12),
                        child: Text("Or"),
                      ),
                      Expanded(child: Divider()),
                    ],
                  ),

                  const SizedBox(height: 20),

                  SocialButton(onTap: () {}),

                  const SizedBox(height: 25),

                  const AuthFooter(
                    title: "Already have an account?",
                    action: "Sign In",
                    onTap: null,
                  ),

                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
