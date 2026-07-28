import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_colors.dart';


abstract class AppTextStyles {
  static TextStyle bold40 = TextStyle(
    fontSize: 40.sp,
    fontWeight: FontWeight.w700,
  );

   static TextStyle bold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle bold36 = TextStyle(
    fontSize: 36.sp,
    fontWeight: FontWeight.w700,
  );
static TextStyle semiBold12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle bold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
  );

  static TextStyle semiBold34 = TextStyle(
    fontSize: 34.sp,
    fontWeight: FontWeight.w600,
  );

  static TextStyle semiBold18 = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static TextStyle extraBold24 = TextStyle(
    fontSize: 24.sp,
    fontWeight: FontWeight.w800,
    fontFamily: 'Montserrat',
  );
  static TextStyle semiBold14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w600,
    fontFamily: 'Montserrat',
  );

  static TextStyle regular12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle regular14 = TextStyle(
    fontSize: 14.sp,
    fontWeight: FontWeight.w400,
  );

  static TextStyle medium12 = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w500,
  );
static TextStyle medium16 = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
  );

  static TextStyle semiBold20 = TextStyle(
    fontSize: 20.sp,
    fontWeight: FontWeight.w600,
  );

  

  static const welcome = TextStyle(
    fontSize: 28,
    fontWeight: FontWeight.w700,
    color: AppColors.lightTextPrimary,
  );

  static const subtitle = TextStyle(
    fontSize: 14,
    color: Colors.grey,
  );

  static const label = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: AppColors.lightTextPrimary,
  );

  static const hint = TextStyle(
    fontSize: 14,
    color: AppColors.lightTextTertiary,
  );

  static const button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: Colors.white,
  );

  static const smallBlue = TextStyle(
    color: AppColors.lightPrimary,
    fontSize: 13,
    fontWeight: FontWeight.w500,
  );

  static const error = TextStyle(
    color: AppColors.error,
    fontSize: 12,
  );

}
