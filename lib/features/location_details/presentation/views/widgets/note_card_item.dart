import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

enum NoteMenuAction { edit, delete, report }

class NoteCardItem extends StatefulWidget {
  final LocationNoteModel note;
  final Function(NoteMenuAction action, LocationNoteModel note)? onMenuSelected;

  const NoteCardItem({
    super.key,
    required this.note,
    this.onMenuSelected,
  });

  @override
  State<NoteCardItem> createState() => _NoteCardItemState();
}

class _NoteCardItemState extends State<NoteCardItem> {
  // ─── Edit Note Dialog ─────────────────────────────────────────────────────
  void _showEditDialog() {
    final TextEditingController textController =
        TextEditingController(text: widget.note.noteText);
    int selectedRating = widget.note.rating.round();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: AppColors.lightSurface,
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        'Edit note',
                        style: AppTextStyles.bold18.copyWith(
                          color: AppColors.lightTextPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Label
                    Text(
                      'my note',
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.lightTextSecondary,
                      ),
                    ),
                    SizedBox(height: 8.h),

                    // Text Field
                    TextField(
                      controller: textController,
                      maxLines: 3,
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.lightTextPrimary,
                      ),
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: AppColors.lightBorder,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: AppColors.lightBorder,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide: const BorderSide(
                            color: AppColors.lightPrimary,
                            width: 1.5,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 16.h),

                    // Rating label
                    Text(
                      'Rating',
                      style: AppTextStyles.regular14.copyWith(
                        color: AppColors.lightTextSecondary,
                      ),
                    ),
                    SizedBox(height: 6.h),

                    // Star selector
                    Row(
                      children: List.generate(5, (index) {
                        return GestureDetector(
                          onTap: () {
                            setDialogState(() {
                              selectedRating = index + 1;
                            });
                          },
                          child: Icon(
                            index < selectedRating
                                ? Icons.star_rounded
                                : Icons.star_outline_rounded,
                            color: AppColors.lightPrimary,
                            size: 28.sp,
                          ),
                        );
                      }),
                    ),
                    SizedBox(height: 24.h),

                    // Buttons row
                    Row(
                      children: [
                        // Cancel
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(dialogContext),
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              side: const BorderSide(
                                color: AppColors.lightPrimary,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            child: Text(
                              'Cancel',
                              style: AppTextStyles.semiBold14.copyWith(
                                color: AppColors.lightPrimary,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        // Save Change
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (textController.text.trim().isNotEmpty) {
                                Navigator.pop(dialogContext);
                                _showSuccessDialog('Note update is successful');
                              }
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.lightPrimary,
                              padding: EdgeInsets.symmetric(vertical: 14.h),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              'Save Change',
                              style: AppTextStyles.semiBold14.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  // ─── Success Dialog ────────────────────────────────────────────────────────
  void _showSuccessDialog(String message, {String title = 'Congratulations!'}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          backgroundColor: AppColors.lightSurface,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 36.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Solid blue check circle with glow shadow
                Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    color: AppColors.lightPrimary,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.lightPrimary.withValues(alpha: 0.35),
                        blurRadius: 20,
                        spreadRadius: 4,
                        offset: const Offset(0, 6),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Icon(
                      Icons.check_rounded,
                      color: AppColors.white,
                      size: 40.sp,
                    ),
                  ),
                ),
                SizedBox(height: 20.h),

                // Congratulations!
                Text(
                  title,
                  style: AppTextStyles.semiBold18.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(height: 8.h),

                // Subtitle
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.regular14.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
                SizedBox(height: 28.h),

                // Back button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightPrimary,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Back',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─── Delete Confirm Dialog ─────────────────────────────────────────────────
  void _showDeleteDialog() {
    showDialog(
      context: context,
      builder: (dialogContext) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          backgroundColor: AppColors.lightSurface,
          child: Padding(
            padding: EdgeInsets.all(20.r),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Title
                Text(
                  'Delete this note?',
                  style: AppTextStyles.semiBold20.copyWith(
                    color: AppColors.lightTextPrimary,
                  ),
                ),
                SizedBox(height: 12.h),

                // Subtitle
                Text(
                  "Are you sure you want to delete this note? This action can't be undone.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.medium18.copyWith(
                    color: AppColors.lightTextSecondary,
                  ),
                ),
                SizedBox(height: 24.h),

                // Delete button (red)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dialogContext);
                      widget.onMenuSelected
                          ?.call(NoteMenuAction.delete, widget.note);
                      _showSuccessDialog('Note deleted is successful');
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.error,
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      elevation: 0,
                    ),
                    child: Text(
                      'Delete',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h),

                // Cancel button (outlined)
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(dialogContext),
                    style: OutlinedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      side: const BorderSide(color: AppColors.lightPrimary),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                    child: Text(
                      'Cancel',
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.lightPrimary,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // ─── Report Dialog ───────────────────────────────────────────────────────
  void _showReportDialog() {
    const List<String> _reasons = [
      'Incorrect information',
      'Offensive content',
      'Spam',
      'Other',
    ];
    String selectedReason = _reasons[0];
    final TextEditingController otherController = TextEditingController();

    showDialog(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (ctx, setDialogState) {
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
              backgroundColor: AppColors.lightSurface,
              child: Padding(
                padding: EdgeInsets.all(20.r),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title
                    Center(
                      child: Text(
                        'Report this note',
                        style: AppTextStyles.semiBold20.copyWith(
                          color: AppColors.lightTextPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),

                    // Subtitle
                    Center(
                      child: Text(
                        'Why are you reporting this note?',
                        style: AppTextStyles.medium12.copyWith(
                          color: AppColors.lightTextSecondary,
                        ),
                      ),
                    ),
                    SizedBox(height: 12.h),

                    // Radio options
                    ..._reasons.map((reason) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                setDialogState(() => selectedReason = reason),
                            child: Row(
                              children: [
                                Radio<String>(
                                  value: reason,
                                  groupValue: selectedReason,
                                  activeColor: AppColors.lightPrimary,
                                  materialTapTargetSize:
                                      MaterialTapTargetSize.shrinkWrap,
                                  visualDensity: const VisualDensity(
                                    horizontal: -4,
                                    vertical: -4,
                                  ),
                                  onChanged: (val) => setDialogState(
                                      () => selectedReason = val!),
                                ),
                                SizedBox(width: 4.w),
                                Text(
                                  reason,
                                  style: AppTextStyles.medium12.copyWith(
                                    color: AppColors.lightTextPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (reason == 'Other' &&
                              selectedReason == 'Other') ...[
                            SizedBox(height: 6.h),
                            TextField(
                              controller: otherController,
                              style: AppTextStyles.medium12.copyWith(
                                color: AppColors.lightTextPrimary,
                              ),
                              decoration: InputDecoration(
                                hintText: 'Please specify',
                                hintStyle: AppTextStyles.medium12.copyWith(
                                  color: AppColors.lightTextTertiary,
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 12.w,
                                  vertical: 10.h,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightBorder),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                      color: AppColors.lightBorder),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                  borderSide: const BorderSide(
                                    color: AppColors.lightPrimary,
                                    width: 1.5,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 4.h),
                          ],
                        ],
                      );
                    }),
                    SizedBox(height: 16.h),

                    // Submit Report button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(dialogContext);
                          widget.onMenuSelected
                              ?.call(NoteMenuAction.report, widget.note);
                          _showSuccessDialog(
                            'Thank you for helping us keep Awraq helpful and accurate',
                            title: 'Report submitted successfully',
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.lightPrimary,
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                          elevation: 0,
                        ),
                        child: Text(
                          'Submit Report',
                          style: AppTextStyles.semiBold14.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),

                    // Cancel button
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () => Navigator.pop(dialogContext),
                        style: OutlinedButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 14.h),
                          side: const BorderSide(color: AppColors.lightPrimary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.r),
                          ),
                        ),
                        child: Text(
                          'Cancel',
                          style: AppTextStyles.semiBold14.copyWith(
                            color: AppColors.lightPrimary,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Row 1: Avatar + Name + TimeAgo + 3-dots
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Avatar
              CircleAvatar(
                radius: 20.r,
                backgroundColor: AppColors.primary10,
                backgroundImage: widget.note.userAvatarUrl.isNotEmpty
                    ? NetworkImage(widget.note.userAvatarUrl)
                    : null,
                child: widget.note.userAvatarUrl.isEmpty
                    ? Text(
                        widget.note.userName.isNotEmpty
                            ? widget.note.userName[0].toUpperCase()
                            : 'U',
                        style: AppTextStyles.bold18.copyWith(
                          color: AppColors.lightPrimary,
                        ),
                      )
                    : null,
              ),
              SizedBox(width: 10.w),

              // Name + Stars + Note Text
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      widget.note.userName,
                      style: AppTextStyles.semiBold14.copyWith(
                        color: AppColors.lightTextPrimary,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Row(
                      children: List.generate(5, (index) {
                        return Icon(
                          index < widget.note.rating.round()
                              ? Icons.star_rounded
                              : Icons.star_outline_rounded,
                          color: AppColors.darkPrimary,
                          size: 14.sp,
                        );
                      }),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      widget.note.noteText,
                      style: AppTextStyles.medium12.copyWith(
                        color: AppColors.lightTextSecondary,
                      ),
                    ),
                  ],
                ),
              ),

              // Time Ago
              Text(
                widget.note.timeAgo,
                style: AppTextStyles.regular14.copyWith(
                  color: AppColors.lightTextTertiary,
                ),
              ),
              SizedBox(width: 4.w),

              // 3-Dots Popup Menu
              PopupMenuButton<NoteMenuAction>(
                onSelected: (action) {
                  if (action == NoteMenuAction.edit) {
                    _showEditDialog();
                  } else if (action == NoteMenuAction.delete) {
                    _showDeleteDialog();
                  } else if (action == NoteMenuAction.report) {
                    _showReportDialog();
                  } else {
                    widget.onMenuSelected?.call(action, widget.note);
                  }
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                color: AppColors.lightSurface,
                elevation: 4,
                constraints: const BoxConstraints(),
                padding: EdgeInsets.zero,
                icon: Icon(
                  LucideIcons.ellipsis,
                  color: AppColors.darkSurface,
                  size: 20.sp,
                ),
                itemBuilder: (BuildContext context) =>
                    <PopupMenuEntry<NoteMenuAction>>[
                  // 1. Edit note
                  PopupMenuItem<NoteMenuAction>(
                    value: NoteMenuAction.edit,
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.pencil,
                          color: AppColors.lightTextPrimary,
                          size: 18.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Edit note',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.lightTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 2. Delete note
                  PopupMenuItem<NoteMenuAction>(
                    value: NoteMenuAction.delete,
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.trash2,
                          color: AppColors.error,
                          size: 18.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Delete note',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // 3. Report note
                  PopupMenuItem<NoteMenuAction>(
                    value: NoteMenuAction.report,
                    child: Row(
                      children: [
                        Icon(
                          LucideIcons.alertCircle,
                          color: AppColors.warning,
                          size: 18.sp,
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Report note',
                          style: AppTextStyles.regular14.copyWith(
                            color: AppColors.lightTextPrimary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
