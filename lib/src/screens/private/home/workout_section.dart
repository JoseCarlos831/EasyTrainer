// lib/src/screens/private/home/workout_section.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';


import '../../../models/workout_model.dart';
import '../../../providers/workout_provider.dart';
import '../details/workout_detail_page.dart';

class WorkoutSection extends StatelessWidget {
  final String searchQuery;

  const WorkoutSection({super.key, required this.searchQuery});

  static const _workoutImages = [
    'assets/imagem/meghan-holmes-wy_L8W0zcpI-unsplash.jpg',
    'assets/imagem/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
    'assets/imagem/victor-freitas-WvDYdXDzkhs-unsplash.jpg',
    'assets/imagem/danielle-cerullo-CQfNt66ttZM-unsplash.jpg',
    'assets/imagem/scott-webb-U5kQvbQWoG0-unsplash.jpg',
  ];

  String _randomWorkoutImage() {
    final random = Random();
    return _workoutImages[random.nextInt(_workoutImages.length)];
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<WorkoutProvider>();
    final workouts = provider.userWorkouts;
    final isLoading = provider.isLoading;
    final local = AppLocalizations.of(context)!;

    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    final filteredWorkouts =
        workouts
            .where(
              (w) => w.name.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();

    if (filteredWorkouts.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Center(
          child: Text(
            local.workoutSection_noWorkoutsFound,
            style: const TextStyle(
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
          filteredWorkouts.map((w) => _workoutCard(context, w, local)).toList(),
    );
  }

  Widget _workoutCard(
    BuildContext context,
    WorkoutModel workout,
    AppLocalizations local,
  ) {
    final imagePath = _randomWorkoutImage();

    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => WorkoutDetailPage(workout: workout),
            ),
          ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(imagePath),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    workout.name,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    workout.description,
                    style: const TextStyle(color: Colors.white70),
                  ),
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
                      Text(
                        local.workoutSection_progressZero,
                        style: const TextStyle(color: Colors.white),
                      ),
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
