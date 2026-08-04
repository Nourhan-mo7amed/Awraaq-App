import 'package:awraq/features/localization/presentation/cubit/language_cubit.dart';
import 'package:awraq/features/localization/presentation/cubit/language_state.dart';
import 'package:awraq/features/localization/presentation/widgets/language_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageView extends StatelessWidget {
  const LanguageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F8FA),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Language",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(16),
            child: Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.shade300),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  LanguageTile(
                    title: "English",
                    locale: const Locale("en"),
                    selected: state.locale.languageCode == "en",
                  ),
                  Divider(height: 1, color: Colors.grey.shade300),
                  LanguageTile(
                    title: "العربية",
                    locale: const Locale("ar"),
                    selected: state.locale.languageCode == "ar",
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
