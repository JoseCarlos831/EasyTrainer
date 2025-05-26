// lib/src/screens/private/details/exercise_detail_page.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personalapp/l10n/app_localizations.dart';


import '../../../models/exercise_model.dart';

class ExerciseDetailPage extends StatelessWidget {
  final ExerciseModel exercise;

  const ExerciseDetailPage({super.key, required this.exercise});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final imagePath = _randomImage();

    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
        title: Text(
          local.exerciseDetail_pageTitle,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerImage(imagePath),
            const SizedBox(height: 16),
            Text(
              exercise.name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            _infoRow(
              local.exerciseDetail_labelDuration,
              _formatDuration(exercise.duration),
            ),
            _infoRow(
              local.exerciseDetail_labelCalories,
              "${exercise.caloriesBurnedEstimate?.toStringAsFixed(0) ?? '--'} kcal",
            ),
            _infoRow(
              local.exerciseDetail_labelEquipment,
              exercise.equipment ?? local.exerciseDetail_equipmentNone,
            ),
            _infoRow(
              local.exerciseDetail_labelBodyPart,
              exercise.bodyPart ?? local.exerciseDetail_bodyPartNotSpecified,
            ),
            const SizedBox(height: 20),
            _section(
              local.exerciseDetail_sectionDescription,
              exercise.description,
            ),
            _section(local.exerciseDetail_sectionSteps, exercise.steps),
            _section(
              local.exerciseDetail_sectionIndicatedFor,
              exercise.indicatedFor,
            ),
            _section(
              local.exerciseDetail_sectionSafetyTips,
              exercise.safetyTips,
            ),
            _section(
              local.exerciseDetail_sectionMistakes,
              exercise.commonMistakes,
            ),
            _section(
              local.exerciseDetail_sectionContraindications,
              exercise.contraindications,
            ),
          ],
        ),
      ),
    );
  }

  Widget _headerImage(String imagePath) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(imagePath, fit: BoxFit.cover),
    );
  }

  Widget _infoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: Row(
        children: [
          const Icon(Icons.fitness_center, color: Colors.tealAccent, size: 18),
          const SizedBox(width: 8),
          Text("$label: ", style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _section(String title, String? content) {
    if (content == null || content.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.tealAccent,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(content, style: const TextStyle(color: Colors.white70)),
        ],
      ),
    );
  }

  String _formatDuration(Duration? d) {
    if (d == null) return "--";
    final minutes = d.inMinutes.remainder(60);
    final seconds = d.inSeconds.remainder(60);
    return minutes > 0 ? "$minutes min" : "$seconds sec";
  }

  String _randomImage() {
    const images = [
      'assets/imagem/meghan-holmes-wy_L8W0zcpI-unsplash.jpg',
      'assets/imagem/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
      'assets/imagem/victor-freitas-WvDYdXDzkhs-unsplash.jpg',
      'assets/imagem/danielle-cerullo-CQfNt66ttZM-unsplash.jpg',
      'assets/imagem/scott-webb-U5kQvbQWoG0-unsplash.jpg',
    ];
    return images[Random().nextInt(images.length)];
  }
}
