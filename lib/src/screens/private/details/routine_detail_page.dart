// lib/src/screens/private/details/routine_detail_page.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:personalapp/l10n/app_localizations.dart';

import 'package:provider/provider.dart';

import '../../../models/routine_model.dart';
import '../../../models/exercise_model.dart';
import '../../../providers/exercise_provider.dart';
import '../../../providers/user_provider.dart';
import 'exercise_detail_page.dart';

class RoutineDetailPage extends StatefulWidget {
  final RoutineModel routine;

  const RoutineDetailPage({super.key, required this.routine});

  @override
  State<RoutineDetailPage> createState() => _RoutineDetailPageState();
}

class _RoutineDetailPageState extends State<RoutineDetailPage> {
  final List<String> _images = const [
    'assets/imagem/meghan-holmes-wy_L8W0zcpI-unsplash.jpg',
    'assets/imagem/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
    'assets/imagem/danielle-cerullo-CQfNt66ttZM-unsplash.jpg',
    'assets/imagem/scott-webb-U5kQvbQWoG0-unsplash.jpg',
  ];

  late String imagePath;

  @override
  void initState() {
    super.initState();
    final token = context.read<UserProvider>().token!;
    final instructorId = widget.routine.instructorId;
    final exerciseProvider = context.read<ExerciseProvider>();

    final random = Random();
    imagePath =
        widget.routine.imageUrl ?? _images[random.nextInt(_images.length)];

    exerciseProvider.fetchExercisesByRoutineId(
      widget.routine.id,
      instructorId,
      token,
    );
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final exercises = context.watch<ExerciseProvider>().getExercisesForRoutine(
      widget.routine.id,
    );

    final totalDuration = exercises.fold(
      Duration.zero,
      (sum, e) => sum + (e.duration ?? Duration.zero),
    );
    final totalCalories = exercises.fold(
      0.0,
      (sum, e) => sum + (e.caloriesBurnedEstimate ?? 0.0),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.routine.name),
        backgroundColor: Colors.black,
      ),
      backgroundColor: const Color(0xFF0B0622),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageHeader(),
            const SizedBox(height: 20),
            _infoTile(
              Icons.schedule,
              local.routineDetail_durationLabel,
              _formatDuration(totalDuration),
            ),
            _infoTile(
              Icons.local_fire_department,
              local.routineDetail_caloriesLabel,
              local.routineDetail_caloriesValue(
                totalCalories.toStringAsFixed(0),
              ),
            ),
            if (widget.routine.description != null)
              _section(
                local.routineDetail_descriptionTitle,
                widget.routine.description,
              ),
            const SizedBox(height: 16),
            _section(local.routineDetail_exerciseTitle, null),
            if (exercises.isEmpty)
              Text(
                local.routineDetail_noExercises,
                style: const TextStyle(color: Colors.white70),
              )
            else
              ...exercises.map(_exerciseCard),
          ],
        ),
      ),
    );
  }

  Widget _imageHeader() {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        image: DecorationImage(
          image:
              imagePath.startsWith('http')
                  ? NetworkImage(imagePath)
                  : AssetImage(imagePath) as ImageProvider,
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        widget.routine.name,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Icon(icon, color: Colors.tealAccent),
          const SizedBox(width: 8),
          Text("$label: ", style: const TextStyle(color: Colors.white70)),
          Text(value, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }

  Widget _section(String title, String? subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.tealAccent,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          if (subtitle != null) ...[
            const SizedBox(height: 4),
            Text(subtitle, style: const TextStyle(color: Colors.white70)),
          ],
        ],
      ),
    );
  }

  Widget _exerciseCard(ExerciseModel ex) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => ExerciseDetailPage(exercise: ex)),
        );
      },
      child: Card(
        color: Colors.white12,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: ListTile(
          title: Text(ex.name, style: const TextStyle(color: Colors.white)),
          subtitle: Text(
            _formatDuration(ex.duration) +
                (ex.caloriesBurnedEstimate != null
                    ? " • ${ex.caloriesBurnedEstimate!.toStringAsFixed(0)} kcal"
                    : ''),
            style: const TextStyle(color: Colors.white60),
          ),
          trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
        ),
      ),
    );
  }

  String _formatDuration(Duration? d) {
    if (d == null) return "--";
    final h = d.inHours;
    final m = d.inMinutes.remainder(60);
    return h > 0 ? "$h h $m min" : "$m min";
  }
}
