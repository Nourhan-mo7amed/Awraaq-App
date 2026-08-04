import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:awraq/features/edit_profile/presentation/widgets/edit_profile_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: const Scaffold(
          body: SafeArea(
            child: EditProfileBody(),
          ),
        ),
      ),
    );
  }
}
// class EditProfileView extends StatelessWidget {
//   const EditProfileView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       behavior: HitTestBehavior.opaque,
      // onTap: () {
      //   FocusScope.of(context).unfocus();
      // },
//       child: Scaffold(
//         appBar: AppBar(
//           title: const Text("Edit Profile"),
//         ),
//         body: const EditProfileBody(),
//       ),
//     );
//   }
// }