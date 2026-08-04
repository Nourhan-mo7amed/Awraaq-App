import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_state.dart';
import 'package:awraq/features/profile/data/model/profile_model.dart';
import 'package:awraq/features/profile/data/repo/profile_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditProfileCubit extends Cubit<EditProfileState> {
  final ProfileRepo repo;

  /// هنخزن بيانات اليوزر اللي جاية من الـ API
  ProfileModel? profile;

  EditProfileCubit({
    required this.repo,
  }) : super(
          EditProfileState(
            fullNameController: TextEditingController(),
            emailController: TextEditingController(),
            phoneController: TextEditingController(),
            selectedGovernorate: "",
          ),
        ) {
    _listenControllers();
  }

  void _listenControllers() {
    state.fullNameController.addListener(_onChanged);
    state.emailController.addListener(_onChanged);
    state.phoneController.addListener(_onChanged);
  }

  void _onChanged() {
    emit(
      state.copyWith(
        isChanged: true,
      ),
    );
  }

  void changeGovernorate(String governorate) {
    emit(
      state.copyWith(
        selectedGovernorate: governorate,
        isChanged: true,
      ),
    );
  }

  void changeImage(String imagePath) {
    emit(
      state.copyWith(
        imagePath: imagePath,
        isChanged: true,
      ),
    );
  }

  /// =======================
  /// GET PROFILE
  /// =======================

  Future<void> getProfile() async {
    try {
      profile = await repo.getProfile();

      state.fullNameController.text = profile!.data.name;
      state.emailController.text = profile!.data.email;
      state.phoneController.text = profile!.data.phone;

      emit(
        state.copyWith(
          selectedGovernorate: profile!.data.governorate,
          imagePath: profile!.data.avatar,
          isChanged: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// =======================
  /// UPDATE PROFILE
  /// =======================

  Future<void> saveProfile() async {
    try {
      final model = ProfileModel(
        message: profile?.message ?? "",
        data: UserData(
          id: profile?.data.id ?? 0,
          name: state.fullNameController.text,
          email: state.emailController.text,
          phone: state.phoneController.text,
          governorate: state.selectedGovernorate,
          avatar: state.imagePath ?? profile?.data.avatar ?? "",
        ),
      );

      profile = await repo.updateProfile(model);

      emit(
        state.copyWith(
          isChanged: false,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Future<void> close() {
    state.fullNameController.dispose();
    state.emailController.dispose();
    state.phoneController.dispose();
    return super.close();
  }
}

// import 'package:awraq/features/edit_profile/presentation/cubit/edit_profile_state.dart';
// import 'package:awraq/features/profile/data/model/profile_model.dart';
// import 'package:awraq/features/profile/data/repo/profile_repository.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EditProfileCubit extends Cubit<EditProfileState> {
//   final ProfileRepo repo;
//   EditProfileCubit({required this.repo})
//       : super(
//           EditProfileState(
//             fullNameController: TextEditingController(),
//             emailController: TextEditingController(),
//             phoneController: TextEditingController(),
//             selectedGovernorate: "",
//             // fullNameController: TextEditingController(text: "Ahmed Mohamed"),
//             // emailController: TextEditingController(
//             //   text: "ahmedmohamed@email.com",
//             // ),
//             // phoneController: TextEditingController(
//             //   text: "+20123456789",
//             // ),
//             // selectedGovernorate: "Dakahlia",
//           ),
//         ) {
//     _listenControllers();
//   }

//   void _listenControllers() {
//     state.fullNameController.addListener(_onChanged);
//     state.emailController.addListener(_onChanged);
//     state.phoneController.addListener(_onChanged);
//   }

//   void _onChanged() {
//     emit(
//       state.copyWith(
//         isChanged: true,
//       ),
//     );
//   }

//   void changeGovernorate(String governorate) {
//     emit(
//       state.copyWith(
//         selectedGovernorate: governorate,
//         isChanged: true,
//       ),
//     );
//   }

//   void changeImage(String imagePath) {
//     emit(
//       state.copyWith(
//         imagePath: imagePath,
//         isChanged: true,
//       ),
//     );
//   }

//   Future<void> getProfile() async {
//     final profile = await repo.getProfile();

//     state.fullNameController.text = profile.data.name;
//     state.emailController.text = profile.data.email;
//     state.phoneController.text = profile.data.phone;

//     emit(
//       state.copyWith(
//         selectedGovernorate: profile.data.governorate,
//         imagePath: profile.data.avatar,
//         isChanged: false,
//       ),
//     );
//   }

//   Future<void> saveProfile() async {
//     final model = ProfileModel(
//       message: "",
//       data: UserData(
//         id: 0,
//         name: state.fullNameController.text,
//         email: state.emailController.text,
//         phone: state.phoneController.text,
//         governorate: state.selectedGovernorate,
//         avatar: state.imagePath ?? "",
//       ),
//     );

//     await repo.updateProfile(model);

//     emit(
//       state.copyWith(
//         isChanged: false,
//       ),
//     );
//   }
//   // Future<void> saveProfile() async {
//   //   /// TODO
//   //   /// API

//   //   emit(
//   //     state.copyWith(
//   //       isChanged: false,
//   //     ),
//   //   );
//   // }

//   @override
//   Future<void> close() {
//     state.fullNameController.dispose();
//     state.emailController.dispose();
//     state.phoneController.dispose();
//     return super.close();
//   }
// }
