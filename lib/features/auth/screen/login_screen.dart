import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../widgets/auth_footer.dart';
import '../widgets/language_switch.dart';
import '../widgets/login_form.dart';
import '../widgets/auth_header.dart';
import '../widgets/social_button.dart';
import 'register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const _LoginView();
  }
}

class _LoginView extends StatefulWidget {
  const _LoginView();

  @override
  State<_LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<_LoginView> {
  bool english = true;

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

                const SizedBox(height: 40),

                const AuthHeader(
                  title: "Welcome Back",
                  subtitle: "Sign in to access your government services",
                ),

                const SizedBox(height: 40),

                const LoginForm(),

                const SizedBox(height: 30),

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

                const SizedBox(height: 24),

                SocialButton(onTap: () {}),

                const SizedBox(height: 30),
                AuthFooter(
                  title: "Don't have an account? ",
                  action: "Register",
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (_) => const RegisterScreen()),
                    );
                  },
                ),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
