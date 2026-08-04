import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTile extends StatelessWidget {
  const ProfileTile({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.onTap,
  });

  final IconData icon;
  final String title;
  final String? trailingText;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(
        horizontal: 14.w,
      ),
      leading: Container(
        padding: EdgeInsets.all(8.w),
        decoration: BoxDecoration(
          color: Colors.grey.shade100,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Icon(icon),
      ),
      title: Text(title),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (trailingText != null)
            Text(
              trailingText!,
              style: const TextStyle(
                color: Colors.grey,
              ),
            ),
          SizedBox(width: 8.w),
          const Icon(Icons.arrow_forward_ios, size: 16),
        ],
      ),
      onTap: onTap,
    );
  }
}