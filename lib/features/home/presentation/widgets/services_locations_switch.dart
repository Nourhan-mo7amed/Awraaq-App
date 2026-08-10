import 'package:flutter/material.dart';

class ServicesLocationsSwitch extends StatelessWidget {
  final bool isServicesSelected;
  final ValueChanged<bool> onChanged;

  const ServicesLocationsSwitch({
    super.key,
    required this.isServicesSelected,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(true),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: isServicesSelected ? Colors.blue : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: isServicesSelected ? Colors.blue : Colors.grey.shade300,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.subtitles_outlined,
                    color: isServicesSelected ? Colors.white : Colors.grey,
                    size: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Services',
                    style: TextStyle(
                      color: isServicesSelected ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GestureDetector(
            onTap: () => onChanged(false),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20),
              decoration: BoxDecoration(
                color: !isServicesSelected ? Colors.blue : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: !isServicesSelected ? Colors.blue : Colors.grey.shade300,
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.map_outlined, // أيقونة الخريطة الجديدة
                    color: !isServicesSelected ? Colors.white : Colors.grey,
                    size: 28,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Locations',
                    style: TextStyle(
                      color: !isServicesSelected ? Colors.white : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}