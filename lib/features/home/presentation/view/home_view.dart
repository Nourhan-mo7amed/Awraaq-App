import 'package:flutter/material.dart';

import '../widgets/home_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // BlocProvider تم وضعه هنا لتسهيل التشغيل كصفحة مستقلة،
    // ولكن في التطبيق الكامل، يتم نقله إلى AppRouter كما طلب سابقاً.
    return Scaffold(
      // backgroundColor: Colors.white,
      body: const SafeArea(
        child: HomeBody(),
      ),
      // bottomNavigationBar: BlocBuilder<HomeCubit, HomeState>(
      //   builder: (context, state) {
      //     int currentIndex = 0;
      //     if (state is HomeLoadedState) {
      //       currentIndex = state.currentBottomNavIndex;
      //     }
      //     return CustomBottomNavBar(
      //       currentIndex: currentIndex,
      //       onTap: (index) {
      //         context.read<HomeCubit>().changeBottomNav(index);
      //       },
    );
    //     },
    //   ),
    // );
  }
}
