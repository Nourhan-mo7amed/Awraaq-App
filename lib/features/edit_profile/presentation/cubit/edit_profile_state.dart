import 'package:flutter/material.dart';

class EditProfileState {
  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController phoneController;

  final String selectedGovernorate;

  final String? imagePath;

  final bool isChanged;

  const EditProfileState({
    required this.fullNameController,
    required this.emailController,
    required this.phoneController,
    required this.selectedGovernorate,
    this.imagePath,
    this.isChanged = false,
  });

  EditProfileState copyWith({
    TextEditingController? fullNameController,
    TextEditingController? emailController,
    TextEditingController? phoneController,
    String? selectedGovernorate,
    String? imagePath,
    bool? isChanged,
  }) {
    return EditProfileState(
      fullNameController:
          fullNameController ?? this.fullNameController,
      emailController:
          emailController ?? this.emailController,
      phoneController:
          phoneController ?? this.phoneController,
      selectedGovernorate:
          selectedGovernorate ?? this.selectedGovernorate,
      imagePath: imagePath ?? this.imagePath,
      isChanged: isChanged ?? this.isChanged,
    );
  }
}