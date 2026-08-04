import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'widgets/custom_bottom_nav_bar.dart';

class LayoutView extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const LayoutView({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CustomBottomNavBar(
        navigationShell: navigationShell,
      ),
    );
  }
}
