import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProfileSection extends StatelessWidget {
  const ProfileSection({
    super.key,
    required this.title,
    required this.isAccount,
  });

  final String title;
  final bool isAccount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w600,
            color: Colors.grey,
          ),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          child: Column(
            children: isAccount
                ? [
                    ProfileTile(
                      icon: Icons.notifications_none,
                      title: "Notifications",
                      onTap: () {
                        context.push(AppRoutes.notifications);
                      },
                    ),
                    Divider(height: 1),
                    ProfileTile(
                      icon: Icons.language,
                      title: "Language",
                      trailingText: "English",
                      onTap: () {
                        context.push(AppRoutes.language);
                      },
                    ),
                    Divider(height: 1),
                    ProfileTile(
                      icon: Icons.light_mode_outlined,
                      title: "Light Mode",
                      onTap: () {
                        context.push(AppRoutes.theme);
                      },
                    ),
                  ]
                : const [
                    ProfileTile(
                      icon: Icons.help_outline,
                      title: "Help & FAQ",
                    ),
                    Divider(height: 1),
                    ProfileTile(
                      icon: Icons.support_agent,
                      title: "Contact Support",
                    ),
                    Divider(height: 1),
                    ProfileTile(
                      icon: Icons.privacy_tip_outlined,
                      title: "Privacy Policy",
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
