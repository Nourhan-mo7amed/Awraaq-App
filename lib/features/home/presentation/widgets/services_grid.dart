import 'package:awraq/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../data/model/service_model.dart';
import 'service_card.dart';

class ServicesGrid extends StatelessWidget {
  final List<ServiceModel> services;

  const ServicesGrid({super.key, required this.services});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: services.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 0.95,
      ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            context.push(
              AppRoutes.procedureDetails,
              extra: services[index].id,
            );
          },
          child: ServiceCard(service: services[index]),
        );
      },
    );
  }
}