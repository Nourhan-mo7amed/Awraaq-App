import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/empty_search_state.dart';
import '../widgets/location_card.dart';
import '../widgets/search_bar_widget.dart';
import '../widgets/location_permission_dialog.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  bool _isSearching = false;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Show permission dialog after a short delay for demonstration
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showPermissionDialog();
    });
  }

  void _showPermissionDialog() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const LocationPermissionDialog(),
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(16.w),
              child: SearchBarWidget(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _isSearching = value.isNotEmpty;
                  });
                },
              ),
            ),
            Expanded(
              child: _isSearching
                  ? _buildSearchResults()
                  : const EmptySearchState(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Service Locations',
                style: AppTextStyles.bold18.copyWith(
                  color: AppColors.lightTextPrimary,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Choose a location to view its address, working hours, contact information, and user notes.',
                style: AppTextStyles.regular12.copyWith(
                  color: AppColors.lightTextSecondary,
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 16.h),
        Expanded(
          child: ListView.separated(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            itemCount: 3,
            separatorBuilder: (context, index) => SizedBox(height: 16.h),
            itemBuilder: (context, index) {
              return LocationCard(
                name: index == 0
                    ? 'Downtown Civil Registry Office'
                    : 'Nasr City Civil Registry Office',
                address: index == 0
                    ? 'Downtown, Cairo, Egypt'
                    : 'Nasr City, Cairo, Egypt',
                workingHours: 'Sunday–Thursday, 8:00 AM–3:00 PM',
                contact: '02 XXX XXXX',
              );
            },
          ),
        ),
      ],
    );
  }
}
