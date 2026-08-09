import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/core/theme/app_text_styles.dart';
import 'package:awraq/features/location_details/data/models/location_details_model.dart';
import 'package:awraq/features/location_details/presentation/views/widgets/location_action_buttons.dart';
import 'package:awraq/features/location_details/presentation/views/widgets/location_header_image.dart';
import 'package:awraq/features/location_details/presentation/views/widgets/location_info_section.dart';
import 'package:awraq/features/location_details/presentation/views/widgets/note_card_item.dart';
import 'package:awraq/features/location_details/presentation/views/widgets/notes_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hugeicons/hugeicons.dart';
//import 'package:hugeicons/hugeicons.dart';

class LocationDetailsView extends StatefulWidget {
  final LocationDetailsModel? location;

  const LocationDetailsView({
    super.key,
    this.location,
  });

  @override
  State<LocationDetailsView> createState() => _LocationDetailsViewState();
}

class _LocationDetailsViewState extends State<LocationDetailsView> {
  late LocationDetailsModel _locationData;
  late bool _isFavorite;

  @override
  void initState() {
    super.initState();
    _locationData = widget.location ?? LocationDetailsModel.mockData;
    _isFavorite = _locationData.isFavorite;
  }

  void _handleNoteMenuAction(NoteMenuAction action, LocationNoteModel note) {
    switch (action) {
      case NoteMenuAction.edit:
        _showSnackBar('Edit note selected for "${note.userName}"');
        break;
      case NoteMenuAction.delete:
        setState(() {
          _locationData.notes.removeWhere((n) => n.id == note.id);
        });
        _showSnackBar('Note deleted successfully');
        break;
      case NoteMenuAction.report:
        _showSnackBar('Note reported for review');
        break;
    }
  }

  void _showAddNoteDialog() {
    final TextEditingController textController = TextEditingController();
    int selectedRating = 5;

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
                        'Add Note',
                        style: AppTextStyles.semiBold20.copyWith(
                          color: AppColors.lightTextPrimary,
                        ),
                      ),
                    ),
                    SizedBox(height: 20.h),

                    // Label
                    Text(
                      'My note',
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
                        hintText: 'Share your tip or experience...',
                        hintStyle: AppTextStyles.regular14.copyWith(
                          color: AppColors.lightTextTertiary,
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 10.h,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              const BorderSide(color: AppColors.lightBorder),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.r),
                          borderSide:
                              const BorderSide(color: AppColors.lightBorder),
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
                            setDialogState(() => selectedRating = index + 1);
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
                                  color: AppColors.lightPrimary),
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
                        // Add Note
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () {
                              if (textController.text.trim().isNotEmpty) {
                                setState(() {
                                  _locationData.notes.insert(
                                    0,
                                    LocationNoteModel(
                                      id: DateTime.now()
                                          .millisecondsSinceEpoch
                                          .toString(),
                                      userName: 'Current User',
                                      userAvatarUrl: '',
                                      timeAgo: 'Just now',
                                      rating: selectedRating.toDouble(),
                                      noteText: textController.text.trim(),
                                      isUserNote: true,
                                    ),
                                  );
                                });
                                Navigator.pop(dialogContext);
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
                              'Add Note',
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

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: AppTextStyles.regular14),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppColors.lightTextPrimary,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      appBar: AppBar(
        backgroundColor: AppColors.lightBackground,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        leading: Padding(
          padding: EdgeInsets.only(left: 8.w),
          child: Center(
            child: GestureDetector(
              onTap: () => context.pop(),
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: Colors.black.withValues(alpha: 0.06),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: HugeIcon(
                  icon: HugeIcons.strokeRoundedArrowLeft01,
                  color: AppColors.lightTextPrimary,
                  size: 20.sp,
                ),
              ),
            ),
          ),
        ),
        title: Text(
          'Location Details',
          textAlign: TextAlign.center,
          style: AppTextStyles.bold24.copyWith(
            color: AppColors.lightTextPrimary,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                _isFavorite = !_isFavorite;
              });
              _showSnackBar(
                _isFavorite ? 'Added to favorites' : 'Removed from favorites',
              );
            },
            icon: HugeIcon(
              icon: HugeIcons.strokeRoundedHeartAdd,
              color: _isFavorite ? AppColors.error : AppColors.lightTextPrimary,
              size: 24.sp,
            ),
          ),
          SizedBox(width: 4.w),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Header Banner Image
            LocationHeaderImage(imageUrl: _locationData.imageUrl),
            SizedBox(height: 16.h),

            // 2. Location Info Section (flat, no card)
            LocationInfoSection(
              name: _locationData.name,
              category: _locationData.category,
              status: _locationData.status,
              rating: _locationData.rating,
              reviewsCount: _locationData.reviewsCount,
              address: _locationData.address,
              workingHours: _locationData.workingHours,
              phoneNumber: _locationData.phoneNumber,
            ),
            SizedBox(height: 14.h),

            // 3. Action Buttons (stacked vertically)
            LocationActionButtons(
              onOpenInMaps: () => _showSnackBar('Opening in Maps...'),
              onGetDirections: () => _showSnackBar('Getting Directions...'),
            ),
            SizedBox(height: 20.h),

            // 4. Notes Section Header & Note Cards
            NotesSection(
              notes: _locationData.notes,
              onAddNote: _showAddNoteDialog,
              onNoteMenuSelected: _handleNoteMenuAction,
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
