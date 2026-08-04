import 'package:awraq/features/edit_profile/presentation/widgets/edit_profile_form.dart';
import 'package:awraq/features/edit_profile/presentation/widgets/profile_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EditProfileBody extends StatelessWidget {
  const EditProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 10.h),

          /// AppBar
          Row(
            children: [
              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios_new_rounded),
              ),
              Expanded(
                child: Center(
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 48),
            ],
          ),

          SizedBox(height: 20.h),

          /// Profile Image
          const ProfileImageWidget(),

          SizedBox(height: 30.h),

          /// Form
          const Expanded(
            child: EditProfileForm(),
          ),
        ],
      ),
    );
  }
}