import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import 'ai_chat_service_item.dart';

class AiChatServiceList extends StatelessWidget {
  final ValueChanged<String>? onServiceSelected;

  const AiChatServiceList({
    super.key,
    this.onServiceSelected,
  });

  @override
  Widget build(BuildContext context) {
    final services = [
      _ServiceData(
        title: 'National ID Creation/Renewal',
        icon: LucideIcons.contact,
      ),
      _ServiceData(
        title: 'National ID Replacement',
        icon: LucideIcons.contact,
      ),
      _ServiceData(
        title: 'Car License /Renewal',
        icon: LucideIcons.car,
      ),
      _ServiceData(
        title: 'Passport/Renewal',
        icon: LucideIcons.tractor,
      ),
      _ServiceData(
        title: 'Birth Certificate Extraction',
        icon: LucideIcons.fileText,
      ),
    ];

    return Column(
      children: services.map(
        (service) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: AiChatServiceItem(
              title: service.title,
              icon: service.icon,
              onTap: () {
                onServiceSelected?.call(service.title);
              },
            ),
          );
        },
      ).toList(),
    );
  }
}

class _ServiceData {
  final String title;
  final IconData icon;

  const _ServiceData({
    required this.title,
    required this.icon,
  });
}