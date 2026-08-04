import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_cubit.dart';
import 'package:awraq/features/governates/presentation/cubit/governorates_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GovernorateDropdown extends StatelessWidget {
  const GovernorateDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GovernoratesCubit, GovernoratesState>(
      builder: (context, governorateState) {
        if (governorateState is GovernoratesLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (governorateState is GovernoratesFailure) {
          return Text(governorateState.message);
        }

        if (governorateState is GovernoratesSuccess) {
          return BlocBuilder<EditProfileCubit, EditProfileState>(
            builder: (context, editState) {
              return DropdownButtonFormField<String>(
                value: editState.selectedGovernorate,
                decoration: const InputDecoration(
                  labelText: "Governorate",
                ),
                items: governorateState.governorates
                    .map(
                      (governorate) => DropdownMenuItem<String>(
                        value: governorate.name,
                        child: Text(governorate.name),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  context
                      .read<EditProfileCubit>()
                      .changeGovernorate(value!);
                },
              );
            },
          );
        }

        return const SizedBox();
      },
    );
  }
}
// import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_cubit.dart';
// import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class GovernorateDropdown extends StatelessWidget {
//   const GovernorateDropdown({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<EditProfileCubit, EditProfileState>(
//       builder: (context, state) {
//         return DropdownButtonFormField<String>(
//           value: state.selectedGovernorate,
//           decoration: const InputDecoration(
//             labelText: "Governorate",
//           ),
//           items: const [
//             "Cairo",
//             "Alexandria",
//             "Giza",
//             "Dakahlia",
//             "Damietta",
//             "Qalyubia",
//             "Beheira",
//             "Monufia",
//           ]
//               .map(
//                 (e) => DropdownMenuItem(
//                   value: e,
//                   child: Text(e),
//                 ),
//               )
//               .toList(),
//           onChanged: (value) {
//             context
//                 .read<EditProfileCubit>()
//                 .changeGovernorate(value!);
//           },
//         );
//       },
//     );
//   }
// }