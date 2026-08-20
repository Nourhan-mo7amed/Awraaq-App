import 'package:awraq/core/routing/app_routes.dart';
import 'package:awraq/features/profile/presentation/widgets/profile_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

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
                      icon: LucideIcons.bell,
                      title: "Notifications",
                      onTap: () {
                        context.push(AppRoutes.notifications);
                      },
                    ),
                    const Divider(height: 1),
                    ProfileTile(
                      icon: LucideIcons.globe,
                      title: "Language",
                      trailingText: "English",
                      onTap: () {
                        context.push(AppRoutes.language);
                      },
                    ),
                    const Divider(height: 1),
                    ProfileTile(
                      icon: LucideIcons.sun,
                      title: "Light Mode",
                      onTap: () {
                        context.push(AppRoutes.theme);
                      },
                    ),
                  ]
                : const [
                    ProfileTile(
                      icon: LucideIcons.helpCircle,
                      title: "Help & FAQ",
                    ),
                    Divider(height: 1),
                    ProfileTile(
                      icon: LucideIcons.headphones,
                      title: "Contact Support",
                    ),
                    Divider(height: 1),
                    ProfileTile(
                      icon: LucideIcons.shieldCheck,
                      title: "Privacy Policy",
                    ),
                  ],
          ),
        ),
      ],
    );
  }
}
