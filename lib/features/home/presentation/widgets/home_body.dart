import 'package:awraq/features/home/presentation/cubit/home_cubit.dart';
import 'package:awraq/features/home/presentation/cubit/home_state.dart';
import 'package:awraq/features/home/presentation/widgets/category_list.dart';
import 'package:awraq/features/home/presentation/widgets/home_header.dart';
import 'package:awraq/features/home/presentation/widgets/services_grid.dart';
import 'package:awraq/features/home/presentation/widgets/services_locations_switch.dart';
import 'package:awraq/features/home/presentation/widgets/tip_of_the_day_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();

        if (state is HomeLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        if (state is HomeFailure) {
          return Center(
            child: Text(state.error),
          );
        }

        if (state is HomeSuccess) {
          return SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
            child: Column(
              children: [
                const HomeHeader(),

                SizedBox(height: 16.h),

                const TipOfTheDayCard(),

                SizedBox(height: 16.h),

                ServicesLocationsSwitch(
                  isServicesSelected: true,
                  onChanged: (value) {
                    // بعدين لما تعملي Locations
                  },
                ),

                SizedBox(height: 16.h),

                CategoryList(
                  categories: state.categories,
                  selectedCategoryId: state.selectedCategoryId,
                  onCategorySelected: (categoryId) {
                    cubit.selectCategory(categoryId);
                  },
                ),

                SizedBox(height: 16.h),

                ServicesGrid(
                  services: state.services,
                ),
              ],
            ),
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
//  import 'package:awraq/features/home/presentation/widgets/home_header.dart';
// import 'package:awraq/features/home/presentation/widgets/services_grid.dart';
// import 'package:awraq/features/home/presentation/widgets/services_locations_switch.dart';
// import 'package:awraq/features/home/presentation/widgets/tip_of_the_day_card.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';


// class HomeBody extends StatelessWidget {
//   const HomeBody({super.key});

//   @override
//   Widget build(BuildContext context) {
  
//           return SingleChildScrollView(
//             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//             child: Column(
//               children: [
//                 const HomeHeader(),
//                 const SizedBox(height: 16),
//                 const TipOfTheDayCard(), // استبدال مربع البحث
//                 const SizedBox(height: 16),
//                 ServicesLocationsSwitch(
//                   isServicesSelected: state.isServicesSelected,
//                   onChanged: (val) => cubit.toggleServicesLocations(val),
//                 ),
//                 const SizedBox(height: 16),
//                 CategoryList(
//                   categories:
//                   selectedIndex: state.selectedCategoryIndex,
//                   onCategorySelected: (index) => cubit.selectCategory(index),
//                 ),
//                 const SizedBox(height: 16),
//                 ServicesGrid(services: state.services),
//               ],
//             ),
//           );
//         }
       
    
//   }
