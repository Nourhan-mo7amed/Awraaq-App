import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AiChatAppBar extends StatelessWidget
    implements PreferredSizeWidget {
  const AiChatAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xffF5F7FC),
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: const [
        Padding(
          padding: EdgeInsets.only(right: 20),
          child: Icon(
            LucideIcons.menu,
            color: Colors.black,
            size: 25,
          ),
        ),
      ],
    );
  }
}