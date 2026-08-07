import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/app_texts/notification_texts.dart';

class EmptyNotification extends StatelessWidget {
  const EmptyNotification({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 120.w,
              height: 120.h,
              decoration: const BoxDecoration(
                color: Color(0xffEEF4FF),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Image.asset(
                  "assets/icons/bell.png",
                  width: 72.w,
                  height: 72.h,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Text(
              NotificationTexts.noNotificationTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(height: 12.h),
            Text(
              NotificationTexts.noNotificationDescription,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14.sp,
                color: Colors.grey,
                height: 1.6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
