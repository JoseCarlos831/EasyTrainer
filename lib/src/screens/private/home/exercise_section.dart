// lib/src/screens/private/home/exercise_section.dart

import 'package:flutter/material.dart';
import 'package:personalapp/l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import '../../../providers/exercise_provider.dart';
import '../../../providers/modality_provider.dart';
import '../../../models/exercise_model.dart';
import '../details/exercise_detail_page.dart';

class ExerciseSection extends StatefulWidget {
  final String searchQuery;

  const ExerciseSection({super.key, required this.searchQuery});

  @override
  State<ExerciseSection> createState() => _ExerciseSectionState();
}

class _ExerciseSectionState extends State<ExerciseSection> {
  int? _selectedModalityId;

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final exerciseProvider = context.watch<ExerciseProvider>();
    final allExercises = exerciseProvider.allExercises;

    final allModalities = context.watch<ModalityProvider>().modalities;
    final Set<int> usedModalityIds =
        allExercises.expand((e) => e.modalityIds).toSet();
    final modalities =
        allModalities.where((m) => usedModalityIds.contains(m.id)).toList();

    final List<ExerciseModel> filteredExercises =
        (_selectedModalityId != null
                ? allExercises.where(
                  (e) => e.modalityIds.contains(_selectedModalityId!),
                )
                : allExercises)
            .where(
              (e) => e.name.toLowerCase().contains(
                widget.searchQuery.toLowerCase(),
              ),
            )
            .toList();

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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        Text(
          local.exerciseSection_titleTraining,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        if (_selectedModalityId != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => setState(() => _selectedModalityId = null),
                icon: const Icon(Icons.clear, color: Colors.tealAccent),
                label: Text(
                  local.exerciseSection_clearFilterButton,
                  style: const TextStyle(color: Colors.tealAccent),
                ),
              ),
            ),
          ),

        SizedBox(
          height: 90,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: modalities.length,
            separatorBuilder: (_, __) => const SizedBox(width: 12),
            itemBuilder: (context, i) {
              final modality = modalities[i];
              final isSelected = modality.id == _selectedModalityId;

              return GestureDetector(
                onTap:
                    () => setState(
                      () =>
                          _selectedModalityId = isSelected ? null : modality.id,
                    ),
                child: Column(
                  children: [
                    CircleAvatar(
                      backgroundColor:
                          isSelected
                              ? Colors.tealAccent.withOpacity(0.3)
                              : Colors.tealAccent.withOpacity(0.1),
                      child: Icon(
                        modalityIcons[modality.name] ?? Icons.fitness_center,
                        color: Colors.tealAccent,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      modality.name,
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 20),
        Text(
          local.exerciseSection_titleExercises,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),

        if (filteredExercises.isEmpty)
          Center(
            child: Text(
              local.exerciseSection_noExercisesFound,
              style: const TextStyle(color: Colors.white70),
            ),
          )
        else
          ...filteredExercises.map(_exerciseCard),
      ],
    );
  }

  Widget _exerciseCard(ExerciseModel ex) {
    final local = AppLocalizations.of(context)!;

    final fallbackImages = [
      'assets/imagem/meghan-holmes-wy_L8W0zcpI-unsplash.jpg',
      'assets/imagem/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
      'assets/imagem/danielle-cerullo-CQfNt66ttZM-unsplash.jpg',
    ];
    final imagePath = ex.imageUrl ?? (fallbackImages..shuffle()).first;

    return GestureDetector(
      onTap:
          () => Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => ExerciseDetailPage(exercise: ex)),
          ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image:
                imagePath.startsWith('http')
                    ? NetworkImage(imagePath)
                    : AssetImage(imagePath) as ImageProvider,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.4),
              BlendMode.darken,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              ex.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                if (ex.sets != null)
                  _infoText(local.exerciseSection_setsLabel, '${ex.sets}x'),
                if (ex.repetition != null)
                  _infoText(
                    local.exerciseSection_repsLabel,
                    '${ex.repetition}',
                  ),
                if (ex.restTime != null)
                  _infoText(
                    local.exerciseSection_restLabel,
                    "${ex.restTime!.inMinutes}:${(ex.restTime!.inSeconds % 60).toString().padLeft(2, '0')} min",
                  ),
              ],
            ),
          ],
        ),
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
