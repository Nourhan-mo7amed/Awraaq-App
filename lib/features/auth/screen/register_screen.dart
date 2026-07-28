import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../core/theme/app_colors.dart';
import '../controller/register_controller.dart';
import '../widgets/register_form.dart';
import '../widgets/auth_footer.dart';
import '../widgets/auth_header.dart';
import '../widgets/language_switch.dart';
import '../widgets/login_button.dart';
import '../widgets/social_button.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RegisterController(),
      child: const _RegisterView(),
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
    final controller = context.watch<RegisterController>();

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
                title: "Create Account",
                enabled: controller.enableButton,
                onPressed: controller.register,
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
  }
}
