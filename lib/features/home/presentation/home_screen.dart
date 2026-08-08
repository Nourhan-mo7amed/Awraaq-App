// import 'package:awraq/core/routing/app_routes.dart';
// import 'package:awraq/core/theme/app_colors.dart';
// import 'package:awraq/features/auth/data/auth_dependencies.dart';
// import 'package:awraq/features/auth/presentation/cubit/auth_status.dart';
// import 'package:awraq/features/auth/presentation/cubit/logout_cubit.dart';
// import 'package:awraq/features/auth/presentation/cubit/logout_state.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:go_router/go_router.dart';

// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (_) => LogoutCubit(buildAuthRepository()),
//       child: BlocListener<LogoutCubit, LogoutState>(
//       listener: (context, state) {
//           if (state.status == AuthStatus.success) {
//             context.go(AppRoutes.login);
//           }

//           if (state.status == AuthStatus.failure && state.message != null) {
//             ScaffoldMessenger.of(
//               context,
//             ).showSnackBar(SnackBar(content: Text(state.message!)));
//           }
//         },
//         child: const _HomeView(),
//       ),
//     );
//   }
// }

// class _HomeView extends StatelessWidget {
//   const _HomeView();

//   @override
//   Widget build(BuildContext context) {
//     final logoutCubit = context.read<LogoutCubit>();

//     return Scaffold(
//       backgroundColor: AppColors.lightBackground,
//       body: SafeArea(
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Text(
//                 'Home',
//                 style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 24),
//               SizedBox(
//                 width: 180,
//                 height: 52,
//                 child: ElevatedButton(
//                   onPressed: logoutCubit.logout,
//                   child: const Text('Logout'),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
