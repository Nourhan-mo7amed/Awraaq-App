import 'package:awraq/core/theme/app_colors.dart';
import 'package:awraq/features/layout/cubit/layout_cubit/layout_cubit.dart';
import 'package:awraq/features/layout/cubit/layout_cubit/layout_states.dart';

import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

class LayoutView extends StatefulWidget {
  const LayoutView({super.key});

  @override
  State<LayoutView> createState() => _LayoutViewState();
}

class _LayoutViewState extends State<LayoutView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LayoutCubit, LayoutStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          body: context
              .read<LayoutCubit>()
              .views[context.read<LayoutCubit>().currentIndex],
          bottomNavigationBar: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50),
            ),
            child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: AppColors.lightBackground,
              selectedItemColor: AppColors.primary10,
              unselectedItemColor: Color.fromARGB(255, 173, 173, 173),
              // const Color.fromARGB(255, 175, 175, 176),
              selectedIconTheme: IconThemeData(size: 24),
              unselectedIconTheme: IconThemeData(size: 20),
              selectedLabelStyle: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
              currentIndex: context.read<LayoutCubit>().currentIndex,
              onTap: (index) {
                context.read<LayoutCubit>().changeLayoutNavBarState(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.house, size: 22),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.search, size: 22),
                  label: 'Search',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.bookmark, size: 22),
                  label: 'Saved',
                ),
                BottomNavigationBarItem(
                  icon: Icon(LucideIcons.messageCircle, size: 22),
                  label: 'AI Chat',
                ),
              ],
            ),
          ),
          //  ),
        );
      },
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:go_router/go_router.dart';

// import 'widgets/custom_bottom_nav_bar.dart';

// class LayoutView extends StatelessWidget {
//   final StatefulNavigationShell navigationShell;

//   const LayoutView({
//     super.key,
//     required this.navigationShell,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: navigationShell,
//       bottomNavigationBar: CustomBottomNavBar(
//         navigationShell: navigationShell,
//       ),
//     );
//   }
// }
