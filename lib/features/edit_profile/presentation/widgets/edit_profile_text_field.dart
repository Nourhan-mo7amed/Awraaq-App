import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum FieldType {
  name,
  email,
  phone,
}

class EditProfileTextField extends StatelessWidget {
  const EditProfileTextField({
    super.key,
    required this.label,
    required this.type,
  });

  final String label;
  final FieldType type;

  @override
  Widget build(BuildContext context) {
    final state = context.read<EditProfileCubit>().state;

    TextEditingController controller;

    switch (type) {
      case FieldType.name:
        controller = state.fullNameController;
        break;

      case FieldType.email:
        controller = state.emailController;
        break;

      case FieldType.phone:
        controller = state.phoneController;
        break;
    }

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  }
}