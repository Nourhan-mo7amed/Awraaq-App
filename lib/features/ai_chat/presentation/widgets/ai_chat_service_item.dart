import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AiChatServiceItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback? onTap;

  const AiChatServiceItem({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(7),
      child: Container(
        height: 40,
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
        ),
        decoration: BoxDecoration(
          color: const Color(0xffF5F7FC),
          borderRadius: BorderRadius.circular(7),
          border: Border.all(
            color: const Color(0xffC8CDD5),
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xff2166E8),
              size: 22,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xff161B25),
                ),
              ),
            ),

            const Icon(
              LucideIcons.chevronRight,
              size: 20,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}