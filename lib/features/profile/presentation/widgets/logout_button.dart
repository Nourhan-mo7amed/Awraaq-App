import 'package:awraq/features/profile/presentation/widgets/logout_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton.icon(
        onPressed: () {
          showDialog(
            context: context,
            builder: (_) => LogoutDialog(
              onLogout: () {
                Navigator.pop(context);

                //context.go(AppRoutes.login);
                // context.read<AuthCubit>().logout();
              },
            ),
          );
        },
        icon: const Icon(
          Icons.logout_rounded,
          color: Colors.red,
        ),
        label: const Text(
          "Log out",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 16.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14.r),
          ),
          side: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
    );
  }
}
