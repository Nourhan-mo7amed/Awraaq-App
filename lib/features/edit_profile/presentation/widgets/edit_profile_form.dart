import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'edit_profile_text_field.dart';
import 'governorate_dropdown.dart';
import 'save_cancel_buttons.dart';

class EditProfileForm extends StatelessWidget {
  const EditProfileForm({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          const EditProfileTextField(
            label: "Full Name",
            type: FieldType.name,
          ),

          SizedBox(height: 16.h),

          const EditProfileTextField(
            label: "Email Address",
            type: FieldType.email,
          ),

          SizedBox(height: 16.h),

          const EditProfileTextField(
            label: "Phone Number",
            type: FieldType.phone,
          ),

          SizedBox(height: 16.h),

          const GovernorateDropdown(),

          SizedBox(height: 20.h),

          Row(
            children: const [
              Icon(
                Icons.info_outline,
                color: Colors.blue,
                size: 18,
              ),
              SizedBox(width: 6),
              Expanded(
                child: Text(
                  "Your information is encrypted and stored securely.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),

          SizedBox(height: 30.h),

          const SaveCancelButtons(),
        ],
      ),
    );
  }
}