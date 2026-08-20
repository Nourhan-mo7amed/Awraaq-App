import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../widgets/location_card.dart';
import '../widgets/search_bar_widget.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';

  final List<Map<String, dynamic>> _allLocations = [
    {
      'id': 1,
      'name': 'Nasr City Civil Registry Office',
      'address': 'Nasr City, Cairo, Egypt',
      'workingHours': 'Sunday–Thursday, 8:00 AM–3:00 PM',
      'contact': '02 XXX XXXX',
    },
    {
      'id': 2,
      'name': 'Nasr City Civil Registry Office',
      'address': 'Nasr City, Cairo, Egypt',
      'workingHours': 'Sunday–Thursday, 8:00 AM–3:00 PM',
      'contact': '02 XXX XXXX',
    },
    {
      'id': 3,
      'name': 'Downtown Civil Registry Office',
      'address': 'Downtown, Cairo, Egypt',
      'workingHours': 'Sunday–Thursday, 8:00 AM–3:00 PM',
      'contact': '02 XXX XXXX',
    },
  ];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final filteredLocations = _allLocations.where((loc) {
      if (_searchQuery.isEmpty) return true;
      final name = loc['name'].toString().toLowerCase();
      final address = loc['address'].toString().toLowerCase();
      final query = _searchQuery.toLowerCase();
      return name.contains(query) || address.contains(query);
    }).toList();

    return Scaffold(
      backgroundColor: AppColors.lightBackground,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Search Bar Header
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
              child: SearchBarWidget(
                controller: _searchController,
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value;
                  });
                },
              ),
            ),

            /// Section Header
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
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 14.h),

            /// Locations List
            Expanded(
              child: filteredLocations.isEmpty
                  ? Center(
                      child: Text(
                        'No locations found matching your search',
                        style: AppTextStyles.regular14.copyWith(
                          color: AppColors.lightTextSecondary,
                        ),
                      ),
                    )
                  : ListView.separated(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16.w,
                        vertical: 4.h,
                      ),
                      physics: const BouncingScrollPhysics(),
                      itemCount: filteredLocations.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 14.h),
                      itemBuilder: (context, index) {
                        final location = filteredLocations[index];
                        return LocationCard(
                          locationId: location['id'],
                          name: location['name'],
                          address: location['address'],
                          workingHours: location['workingHours'],
                          contact: location['contact'],
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
