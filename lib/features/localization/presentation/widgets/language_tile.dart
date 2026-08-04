import 'package:awraq/features/localization/presentation/cubit/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LanguageTile extends StatelessWidget {
  const LanguageTile({
    super.key,
    required this.title,
    required this.locale,
    required this.selected,
  });

  final String title;
  final Locale locale;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      trailing: Radio<Locale>(
        value: locale,
        groupValue: selected ? locale : null,
        onChanged: (_) {
          context.read<LanguageCubit>().changeLanguage(locale);
        },
      ),
      onTap: () {
        context.read<LanguageCubit>().changeLanguage(locale);
      },
    );
  }
}
