import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class AiChatIntroCard extends StatelessWidget {
  const AiChatIntroCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 35,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffF5F7FC),
        borderRadius: BorderRadius.circular(7),
        border: Border.all(
          color: const Color(0xffE1E5ED),
        ),
      ),
      child: Column(
        children: [
          Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
              color: const Color(0xffDFF1FF),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Icon(
              LucideIcons.bot,
              color: Color(0xff28A9F5),
              size: 32,
            ),
          ),

          const SizedBox(height: 15),

          const Text(
            'How can I help you?',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xff087CFF),
            ),
          ),

          const SizedBox(height: 5),

          const Text(
            'Choose a service to get started.',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xff718096),
            ),
          ),
        ],
      ),
    );
  }
}