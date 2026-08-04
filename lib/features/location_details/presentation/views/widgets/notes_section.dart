import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:awraq/features/location_details/presentation/views/widgets/note_card_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotesSection extends StatelessWidget {
  final List<LocationNoteModel> notes;
  final VoidCallback? onAddNote;
  final Function(NoteMenuAction action, LocationNoteModel note)?
      onNoteMenuSelected;

  const NotesSection({
    super.key,
    required this.notes,
    this.onAddNote,
    this.onNoteMenuSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section Header
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Notes about this location',
              style: AppTextStyles.bold18.copyWith(
                color: AppColors.lightTextPrimary,
              ),
            ),
            GestureDetector(
              onTap: onAddNote,
              child: Text(
                '+ Add Note',
                style: AppTextStyles.bold18.copyWith(
                  color: AppColors.lightPrimary,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 16.h),

        // Notes List or Empty State
        if (notes.isEmpty)
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 24.h),
              child: Text(
                'No notes yet. Be the first to add one!',
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.lightTextTertiary,
                ),
              ),
            ),
          )
        else
          Column(
            children: notes.map((note) {
              return NoteCardItem(
                note: note,
                onMenuSelected: onNoteMenuSelected,
              );
            }).toList(),
          ),
      ],
    );
  }
}
