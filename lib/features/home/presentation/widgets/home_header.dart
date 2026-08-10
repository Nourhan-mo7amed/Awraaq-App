import 'package:awraq/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap:()=> context.push(AppRoutes.profile),
          child: const CircleAvatar(
            radius: 22,
            backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=11'), // الصورة الشخصية
          ),
        ),
        const SizedBox(width: 12),
        const Text(
          'Ahmed Mohamed',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.location_on_outlined, color: Colors.blue),
        ),
        IconButton(
          onPressed: () =>context.push(AppRoutes.notifications),
          icon: const Icon(Icons.notifications_none_outlined, color: Colors.blue),
        ),
      ],
    );
  }
}