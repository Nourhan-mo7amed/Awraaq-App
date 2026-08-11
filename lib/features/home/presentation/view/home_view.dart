import 'package:awraq/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

import '../widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: const SafeArea(
        child: HomeBody(),
      ),
    );
  }
}
