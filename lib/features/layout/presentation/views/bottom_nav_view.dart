import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
import 'package:awraq/features/layout/cubit/layout_cubit/layout_states.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class LayoutView extends StatelessWidget {
  const LayoutView({super.key, });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutCubit, LayoutStates>(
      builder: (context, state) {
        final cubit = context.read<LayoutCubit>();

        return Scaffold(
          body: cubit.views[cubit.currentIndex],
          bottomNavigationBar: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeLayoutNavBarState(index);
              },
              type: BottomNavigationBarType.fixed,
              elevation: 0,
              backgroundColor: Colors.transparent,
              selectedItemColor: AppColors.lightPrimary,
              unselectedItemColor: Color(0xFF9AA8BD),
              selectedFontSize: 12,
              unselectedFontSize: 12,
              items: [
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    LucideIcons.house,
                    cubit.currentIndex == 0,
                  ),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    LucideIcons.search,
                    cubit.currentIndex == 1,
                  ),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    LucideIcons.bookmark,
                    cubit.currentIndex == 2,
                  ),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: _buildIcon(
                    LucideIcons.messageCircle,
                    cubit.currentIndex == 3,
                  ),
                  label: 'AI Chat',
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Widget _buildIcon(IconData icon, bool isSelected) {
    return Icon(
      icon,
      size: isSelected ? 24 : 20,
    );
  }
}
// import 'package:awraq/core/theme/app_colors.dart';
// import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
// import 'package:awraq/features/layout/cubit/layout_cubit/layout_states.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:lucide_icons_flutter/lucide_icons.dart';

// class LayoutView extends StatelessWidget {
//   const LayoutView({super.key});

//   @override
//   Widget build(BuildContext context) {
// <<<<<<< HEAD
//     return BlocBuilder<LayoutCubit, LayoutStates>(
//       builder: (context, state) {
//         final cubit = context.read<LayoutCubit>();

//         return Scaffold(
//           body: cubit.views[cubit.currentIndex],

//           bottomNavigationBar: Container(
//             decoration: const BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.only(
//                 topLeft: Radius.circular(20),
//                 topRight: Radius.circular(20),
//               ),
//             ),
//             child: BottomNavigationBar(
//               currentIndex: cubit.currentIndex,

//               onTap: (index) {
//                 cubit.changeLayoutNavBarState(index);
//               },

//               type: BottomNavigationBarType.fixed,
//               elevation: 0,
//               backgroundColor: Colors.transparent,

//               selectedItemColor: AppColors.lightPrimary,
//               unselectedItemColor: const Color(0xFF9AA8BD),

//               selectedFontSize: 12,
//                unselectedFontSize: 12,

//               items: [
//                 BottomNavigationBarItem(
//                   icon: _buildIcon(
//                     LucideIcons.house,
//                     cubit.currentIndex == 0,
//                   ),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: _buildIcon(
//                     LucideIcons.search,
//                     cubit.currentIndex == 1,
//                   ),
//                   label: 'Search',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: _buildIcon(
//                     LucideIcons.bookmark,
//                     cubit.currentIndex == 2,
//                   ),
//                   label: 'Saved',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: _buildIcon(
//                     LucideIcons.messageCircle,
//                     cubit.currentIndex == 3,
//                   ),
// =======
//     return BlocConsumer<LayoutCubit, LayoutStates>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         return Scaffold(
//           body: context
//               .read<LayoutCubit>()
//               .views[context.read<LayoutCubit>().currentIndex],
//           bottomNavigationBar: ClipRRect(
//             borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(50),
//               topRight: Radius.circular(50),
//             ),
//             child: BottomNavigationBar(
//               elevation: 0,
//               backgroundColor: AppColors.lightBackground,
//               selectedItemColor: AppColors.primary10,
//               unselectedItemColor: Color.fromARGB(255, 173, 173, 173),
//               // const Color.fromARGB(255, 175, 175, 176),
//               selectedIconTheme: IconThemeData(size: 24),
//               unselectedIconTheme: IconThemeData(size: 20),
//               selectedLabelStyle: TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.w600,
//               ),
//               unselectedLabelStyle: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.w500,
//               ),
//               currentIndex: context.read<LayoutCubit>().currentIndex,
//               onTap: (index) {
//                 context.read<LayoutCubit>().changeLayoutNavBarState(index);
//               },
//               items: [
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.house, size: 22),
//                   label: 'Home',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.search, size: 22),
//                   label: 'Search',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.bookmark, size: 22),
//                   label: 'Saved',
//                 ),
//                 BottomNavigationBarItem(
//                   icon: Icon(LucideIcons.messageCircle, size: 22),
// >>>>>>> feature/home
//                   label: 'AI Chat',
//                 ),
//               ],
//             ),
//           ),
// <<<<<<< HEAD
//         );
//       },
//     );
//   }

//   Widget _buildIcon(IconData icon, bool isSelected) {
//     return Container(
//       padding: const EdgeInsets.symmetric(
//         horizontal: 16,
//         vertical: 8,
//       ),
//       decoration: BoxDecoration(
//         color: isSelected
//             ? const Color(0xFFE8F2FF)
//             : Colors.transparent,
//         borderRadius: BorderRadius.circular(18),
//       ),
//       child: Icon(
//         icon,
//         size: 22,
//       ),
// =======
//           //  ),
//         );
//       },
// >>>>>>> feature/home
//     );
//   }
// }
// // import 'package:awraq/core/theme/app_colors.dart';
// // import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
// // import 'package:awraq/features/layout/cubit/layout_cubit/layout_states.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_bloc/flutter_bloc.dart';
// // import 'package:lucide_icons_flutter/lucide_icons.dart';

// // class LayoutView extends StatelessWidget {
// //   const LayoutView({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     return BlocBuilder<LayoutCubit, LayoutStates>(
// //       builder: (context, state) {
// //         final cubit = context.read<LayoutCubit>();

// //         return Scaffold(
// //           backgroundColor: const Color(0xFFF5F7FC),

// //           body: cubit.views[cubit.currentIndex],

// //           bottomNavigationBar: Container(
// //             decoration: const BoxDecoration(
// //               color: Colors.white,
// //               borderRadius: BorderRadius.only(
// //                 topLeft: Radius.circular(20),
// //                 topRight: Radius.circular(20),
// //               ),
// //             ),

// //             child: BottomNavigationBar(
// //               currentIndex: cubit.currentIndex,

// //               onTap: (index) {
// //                 cubit.changeLayoutNavBarState(index);
// //               },

// //               type: BottomNavigationBarType.fixed,

// //               elevation: 0,

// //               backgroundColor: Colors.transparent,

// //               selectedItemColor: AppColors.lightPrimary,

// //               unselectedItemColor: const Color(0xFF9AA8BD),

// //               selectedFontSize: 12,

// //               unselectedFontSize: 12,

// //               selectedLabelStyle: const TextStyle(
// //                 fontWeight: FontWeight.w600,
// //               ),

// //               unselectedLabelStyle: const TextStyle(
// //                 fontWeight: FontWeight.w500,
// //               ),

// //               items: [
// //                 BottomNavigationBarItem(
// //                   icon: _buildIcon(
// //                     icon: LucideIcons.house,
// //                     isSelected: cubit.currentIndex == 0,
// //                   ),
// //                   label: 'Home',
// //                 ),

// //                 BottomNavigationBarItem(
// //                   icon: _buildIcon(
// //                     icon: LucideIcons.search,
// //                     isSelected: cubit.currentIndex == 1,
// //                   ),
// //                   label: 'Search',
// //                 ),

// //                 BottomNavigationBarItem(
// //                   icon: _buildIcon(
// //                     icon: LucideIcons.bookmark,
// //                     isSelected: cubit.currentIndex == 2,
// //                   ),
// //                   label: 'Saved',
// //                 ),

// //                 BottomNavigationBarItem(
// //                   icon: _buildIcon(
// //                     icon: LucideIcons.messageCircle,
// //                     isSelected: cubit.currentIndex == 3,
// //                   ),
// //                   label: 'AI Chat',
// //                 ),
// //               ],
// //             ),
// //           ),
// //         );
// //       },
// //     );
// //   }

// //   Widget _buildIcon({
// //     required IconData icon,
// //     required bool isSelected,
// //   }) {
// //     return Container(
// //       padding: const EdgeInsets.symmetric(
// //         horizontal: 16,
// //         vertical: 8,
// //       ),
// //       decoration: BoxDecoration(
// //         color: isSelected
// //             ? const Color(0xFFE8F2FF)
// //             : Colors.transparent,
// //         borderRadius: BorderRadius.circular(18),
// //       ),
// //       child: Icon(
// //         icon,
// //         size: 22,
// //       ),
// //     );
// //   }
// // }
// // // import 'package:awraq/core/theme/app_colors.dart';
// // // import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
// // // import 'package:awraq/features/layout/cubit/layout_cubit/layout_states.dart';

// // // import 'package:flutter/material.dart';

// // // import 'package:flutter_bloc/flutter_bloc.dart';
// // // import 'package:lucide_icons_flutter/lucide_icons.dart';

// // // class LayoutView extends StatefulWidget {
// // //   const LayoutView({super.key});

// // //   @override
// // //   State<LayoutView> createState() => _LayoutViewState();
// // // }

// // // class _LayoutViewState extends State<LayoutView> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return BlocProvider(
// // //       create: (BuildContext context) => LayoutCubit(),
// // //       child: BlocConsumer<LayoutCubit, LayoutStates>(
// // //         listener: (context, state) {},
// // //         builder: (context, state) {
// // //           return Scaffold(
// // //             body: context
// // //                 .read<LayoutCubit>()
// // //                 .views[context.read<LayoutCubit>().currentIndex],
// // //             bottomNavigationBar: ClipRRect(
// // //               borderRadius: BorderRadius.only(
// // //                 topLeft: Radius.circular(50),
// // //                 topRight: Radius.circular(50),
// // //               ),
// // //               child: BottomNavigationBar(
// // //                 elevation: 0,
// // //                 backgroundColor: AppColors.lightBackground,
// // //                 selectedItemColor: AppColors.lightPrimary,
// // //                 unselectedItemColor: Color.fromARGB(255, 173, 173, 173),
// // //                 // const Color.fromARGB(255, 175, 175, 176),
// // //                 selectedIconTheme: IconThemeData(size: 20),
// // //                 unselectedIconTheme: IconThemeData(size: 20),
// // //                 selectedLabelStyle: TextStyle(
// // //                   fontSize: 20,
// // //                   fontWeight: FontWeight.w600,
// // //                 ),
// // //                 unselectedLabelStyle: TextStyle(
// // //                   fontSize: 16,
// // //                   fontWeight: FontWeight.w500,
// // //                 ),
// // //                 currentIndex: context.read<LayoutCubit>().currentIndex,
// // //                 onTap: (index) {
// // //                   context.read<LayoutCubit>().changeLayoutNavBarState(index);
// // //                 },
// // //                 items: [
// // //                   BottomNavigationBarItem(
// // //                     icon: Icon(LucideIcons.house, size: 22),
// // //                     label: 'Home',
// // //                   ),
// // //                   BottomNavigationBarItem(
// // //                     icon: Icon(LucideIcons.search, size: 22),
// // //                     label: 'Search',
// // //                   ),
// // //                   BottomNavigationBarItem(
// // //                     icon: Icon(LucideIcons.bookmark, size: 22),
// // //                     label: 'Saved',
// // //                   ),
// // //                   BottomNavigationBarItem(
// // //                     icon: Icon(LucideIcons.messageCircle, size: 22),
// // //                     label: 'AI Chat',
// // //                   ),
// // //                 ],
// // //               ),
// // //             ),
// // //             //  ),
// // //           );
// // //         },
// // //       ),
// // //     );
// // //   }
// // // }

// // // // import 'package:flutter/material.dart';
// // // // import 'package:go_router/go_router.dart';

// // // // import 'widgets/custom_bottom_nav_bar.dart';

// // // // class LayoutView extends StatelessWidget {
// // // //   final StatefulNavigationShell navigationShell;

// // // //   const LayoutView({
// // // //     super.key,
// // // //     required this.navigationShell,
// // // //   });

// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       body: navigationShell,
// // // //       bottomNavigationBar: CustomBottomNavBar(
// // // //         navigationShell: navigationShell,
// // // //       ),
// // // //     );
// // // //   }
// // // // }
