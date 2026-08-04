import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SaveCancelButtons extends StatelessWidget {
  const SaveCancelButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditProfileCubit, EditProfileState>(
      builder: (context, state) {
        return Column(
          children: [
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                onPressed: state.isChanged
                    ? () async {
                        await context.read<EditProfileCubit>().saveProfile();

                        context.pop(true);
                      }
                    : null,
                child: const Text("Save Changes"),
              ),
            ),
            SizedBox(height: 12.h),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ),
          ],
        );
      },
    );
  }
}
