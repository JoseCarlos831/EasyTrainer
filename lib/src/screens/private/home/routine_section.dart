import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/modality_provider.dart';
import '../../../providers/workout_provider.dart';
import '../../../providers/exercise_provider.dart';
import '../../../models/exercise_model.dart';

class RoutineSection extends StatelessWidget {
  final String searchQuery;

  const RoutineSection({super.key, required this.searchQuery});

  @override
  Widget build(BuildContext context) {
    final modalities = context.watch<ModalityProvider>().modalities;
    final workouts = context.watch<WorkoutProvider>().userWorkouts;
    final exerciseProvider = context.watch<ExerciseProvider>();

    final Map<String, IconData> modalityIcons = {
      'Yoga': Icons.self_improvement,
      'Pilates': Icons.accessibility_new,
      'CrossFit': Icons.sports_gymnastics,
      'Calisthenics': Icons.fitness_center,
      'Bodybuilding': Icons.sports_mma,
      'Functional Training': Icons.directions_run,
      'Martial Arts': Icons.sports_kabaddi,
      'Dance Fitness': Icons.music_note,
      'Athletic Training': Icons.directions_run,
      'Rehabilitation': Icons.healing,
    };

    final List<ExerciseModel> allExercises =
        workouts
            .expand((w) => exerciseProvider.getExercisesForWorkout(w.id))
            .toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text(
          "Training",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: modalities.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final modality = modalities[i];
              return Column(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.tealAccent.withOpacity(0.1),
                    child: Icon(
                      modalityIcons[modality.name] ?? Icons.fitness_center,
                      color: Colors.tealAccent,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    modality.name,
                    style: const TextStyle(color: Colors.white70, fontSize: 12),
                  ),
                ],
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        const Text(
          "Exercises",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        if (allExercises.isEmpty)
          const Center(
            child: Text(
              "Nenhum exercício encontrado.",
              style: TextStyle(color: Colors.white70),
            ),
          )
        else
          ...allExercises.map(_exerciseCard).toList(),
      ],
    );
  }

  Widget _exerciseCard(ExerciseModel ex) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1732),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              ex.imageUrl ?? '',
              width: 90,
              height: 90,
              fit: BoxFit.cover,
              errorBuilder:
                  (_, __, ___) => const Icon(
                    Icons.image_not_supported,
                    size: 90,
                    color: Colors.white24,
                  ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ex.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  children: [
                    if (ex.sets != null) _infoText("Séries", '${ex.sets}x'),
                    if (ex.repetition != null)
                      _infoText("Reps", '${ex.repetition}'),
                    if (ex.restTime != null)
                      _infoText(
                        "Descanso",
                        "${ex.restTime!.inMinutes}:${(ex.restTime!.inSeconds % 60).toString().padLeft(2, '0')} min",
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(color: Colors.white54, fontSize: 10),
          ),
          Text(
            value,
            style: const TextStyle(color: Colors.white, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
