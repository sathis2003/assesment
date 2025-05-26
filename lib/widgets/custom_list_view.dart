import 'package:flutter/material.dart';

import '../models/music_service.dart';
import '../views/widgets/service_card.dart';

class ServiceListView extends StatelessWidget {
  final List<MusicService> services;

  const ServiceListView({
    super.key,
    required this.services,
  });

  List<MusicService> _getOrderedServices() {
    final orderedTitles = [
      'Music Production',
      'Mixing & Mastering',
      'Lyrics Writing',
      'Vocals'
    ];

    List<MusicService> orderedServices = [];

    for (String title in orderedTitles) {
      final matches = services.where(
            (s) => s.title.toLowerCase().contains(title.toLowerCase()),
      );
      if (matches.isNotEmpty) {
        orderedServices.add(matches.first);
      }
    }

    for (MusicService service in services) {
      if (!orderedServices.contains(service)) {
        orderedServices.add(service);
      }
    }

    return orderedServices;
  }

  @override
  Widget build(BuildContext context) {
    final orderedServices = _getOrderedServices();

    return ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: orderedServices.length,
      itemBuilder: (context, index) {
        return ServiceCard(service: orderedServices[index]);
      },
      separatorBuilder: (context, index) => const SizedBox(height: 8),
    );
  }
}