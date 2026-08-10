import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({
    super.key,
    required this.type,
  });

  final String type;

  IconData get icon {
    switch (type) {
      case 'info':
        return LucideIcons.sparkles;

      case 'warning':
        return LucideIcons.clock;

      case 'location':
        return LucideIcons.mapPin;

      default:
        return LucideIcons.bell;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 42.w,
      height: 42.h,
      decoration: BoxDecoration(
        color: const Color(0xffF4F8FF),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Icon(
        icon,
        size: 20.sp,
        color: const Color(0xff1677FF),
      ),
    );
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class NotificationIcon extends StatelessWidget {
//   const NotificationIcon({
//     super.key,
//     required this.icon,
//   });

//   final String icon;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 42.w,
//       height: 42.h,
//       decoration: BoxDecoration(
//         color: const Color(0xffF4F8FF),
//         borderRadius: BorderRadius.circular(12.r),
//       ),
//       child: Center(
//         child: Image.asset(
//           icon,
//           width: 20.w,
//           height: 20.h,
//           fit: BoxFit.contain,
//         ),
//       ),
//     );
//   }
// }