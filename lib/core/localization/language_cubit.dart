import 'package:awraq/core/localization/language_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState(Locale('en')));
// تغير لاي لغة هتديلي الكود بتاعها 
  void changeLanguage(Locale languageCode) {
    emit(LanguageState(languageCode));
  }
}
// تبدل بين لغتين عربي وانجلش
// void toggleLanguage() {
//     emit(
//       LanguageState(
//         state.locale.languageCode == 'en'
//             ? const Locale('ar')
//             : const Locale('en'),
//       ),
//     );
//   }