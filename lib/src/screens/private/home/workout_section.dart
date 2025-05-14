// lib/src/screens/private/home/workout_section.dart

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/workout_provider.dart';

class WorkoutSection extends StatelessWidget {
  final String searchQuery;

  const WorkoutSection({super.key, required this.searchQuery});

  final List<String> _workoutImages = const [
    'assets/imagem/meghan-holmes-wy_L8W0zcpI-unsplash.jpg',
    'assets/imagem/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
    'assets/imagem/victor-freitas-WvDYdXDzkhs-unsplash.jpg',
    'assets/imagem/danielle-cerullo-CQfNt66ttZM-unsplash.jpg',
    'assets/imagem/scott-webb-U5kQvbQWoG0-unsplash.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final workouts = context.watch<WorkoutProvider>().userWorkouts;
    final isLoading = context.watch<WorkoutProvider>().isLoading;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (workouts.isEmpty) {
      return const Padding(
        padding: EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            "Nenhum workout encontrado.",
            style: TextStyle(
              color: Colors.white70,
              fontSize: 16,
              fontStyle: FontStyle.italic,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      );
    }

    return Column(
      children:
          workouts.map((workout) {
            return _workoutCard(
              title: workout.name,
              subtitle: workout.description,
              progress: 0.0, // Progresso mockado por enquanto
            );
          }).toList(),
    );
  }

  Widget _workoutCard({
    required String title,
    required String subtitle,
    required double progress,
  }) {
    final random = Random();
    final imagePath = _workoutImages[random.nextInt(_workoutImages.length)];

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.4),
            BlendMode.darken,
          ),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                  const SizedBox(height: 12),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      const SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: 0.0,
                          backgroundColor: Colors.white24,
                          valueColor: AlwaysStoppedAnimation(Colors.tealAccent),
                          strokeWidth: 4,
                        ),
                      ),
                      const Text('0%', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
