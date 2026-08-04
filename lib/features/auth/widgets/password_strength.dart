import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';


class PasswordStrength extends StatelessWidget {
  const PasswordStrength({
    super.key,
    required this.strength,
  });

  final double strength;

  @override
  Widget build(BuildContext context) {

    int activeBars = 0;

    if (strength >= .25) activeBars = 1;
    if (strength >= .50) activeBars = 2;
    if (strength >= .75) activeBars = 3;
    if (strength == 1) activeBars = 4;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Password strength",
            style: TextStyle(
              fontSize: 12,
              color: Colors.grey,
            ),
          ),
        ),

        const SizedBox(height: 8),

        Row(
          children: List.generate(
            4,
            (index) => Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  right: index == 3 ? 0 : 6,
                ),
                height: 4,
                decoration: BoxDecoration(
                  color: index < activeBars
                      ? AppColors.lightPrimary
                      : AppColors.lightGray,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}