// lib/src/screens/private/details/workout_detail_page.dart

import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';


import '../../../models/workout_model.dart';
import '../../../models/exercise_model.dart';
import '../../../models/routine_model.dart';

import '../../../providers/user_provider.dart';
import '../../../providers/exercise_provider.dart';
import '../../../providers/routine_provider.dart';
import 'exercise_detail_page.dart';
import 'routine_detail_page.dart';

class WorkoutDetailPage extends StatefulWidget {
  final WorkoutModel workout;

  const WorkoutDetailPage({super.key, required this.workout});

  @override
  State<WorkoutDetailPage> createState() => _WorkoutDetailPageState();
}

class _WorkoutDetailPageState extends State<WorkoutDetailPage> {
  final List<String> _images = const [
    'assets/imagem/meghan-holmes-wy_L8W0zcpI-unsplash.jpg',
    'assets/imagem/victor-freitas-hOuJYX2K5DA-unsplash.jpg',
    'assets/imagem/victor-freitas-WvDYdXDzkhs-unsplash.jpg',
    'assets/imagem/danielle-cerullo-CQfNt66ttZM-unsplash.jpg',
    'assets/imagem/scott-webb-U5kQvbQWoG0-unsplash.jpg',
  ];

  late String imagePath;

  @override
  void initState() {
    super.initState();
    final token = context.read<UserProvider>().token!;
    final instructorId = widget.workout.instructorId;

    final exerciseProvider = context.read<ExerciseProvider>();
    final routineProvider = context.read<RoutineProvider>();

    final random = Random();
    imagePath = _images[random.nextInt(_images.length)];

    exerciseProvider.fetchExercisesByWorkoutId(
      widget.workout.id,
      instructorId,
      token,
    );

    routineProvider
        .fetchRoutinesByWorkoutId(widget.workout.id, instructorId, token)
        .then((_) {
          final routines = routineProvider.getRoutinesForWorkout(
            widget.workout.id,
          );
          for (final r in routines) {
            exerciseProvider.fetchExercisesByRoutineId(
              r.id,
              instructorId,
              token,
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final exerciseProvider = context.watch<ExerciseProvider>();
    final routineProvider = context.watch<RoutineProvider>();

    final exercises = exerciseProvider.getExercisesForWorkout(
      widget.workout.id,
    );
    final routines = routineProvider.getRoutinesForWorkout(widget.workout.id);

    final totalDuration = _calculateTotalDurationIncludingRoutines(
      exercises,
      routines,
      exerciseProvider,
    );
    final totalCalories = _calculateTotalCaloriesIncludingRoutines(
      exercises,
      routines,
      exerciseProvider,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.workout.name),
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
            _sectionTitle(local.workoutDetail_descriptionSectionTitle),
            Text(
              widget.workout.description,
              style: const TextStyle(color: Colors.white70),
            ),
            const SizedBox(height: 16),
            _infoTile(
              Icons.schedule,
              local.workoutDetail_durationLabel,
              _formatDuration(totalDuration),
            ),
            _infoTile(
              Icons.local_fire_department,
              local.workoutDetail_caloriesLabel,
              "${totalCalories.toStringAsFixed(0)} kcal",
            ),
            _infoTile(
              Icons.calendar_today,
              local.workoutDetail_daysLabel,
              widget.workout.numberOfDays.toString(),
            ),
            const SizedBox(height: 16),
            if (exercises.isNotEmpty) ...[
              _sectionTitle(local.workoutDetail_directExercisesTitle),
              ...exercises.map(_exerciseCard),
              const SizedBox(height: 16),
            ],
            if (routines.isNotEmpty) ...[
              _sectionTitle(local.workoutDetail_routinesTitle),
              ...routines.map((r) => _routineCard(r, exerciseProvider)),
            ],
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
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.3),
            BlendMode.darken,
          ),
        ),
      ),
      alignment: Alignment.center,
      child: Text(
        widget.workout.name,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _infoTile(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, color: Colors.tealAccent),
        const SizedBox(width: 8),
        Text("$label: ", style: const TextStyle(color: Colors.white70)),
        Text(value, style: const TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.tealAccent,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _exerciseCard(ExerciseModel exercise) {
    return Card(
      color: Colors.white10,
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        title: Text(exercise.name, style: const TextStyle(color: Colors.white)),
        subtitle: Text(
          _formatDuration(exercise.duration) +
              (exercise.caloriesBurnedEstimate != null
                  ? " • ${exercise.caloriesBurnedEstimate!.toStringAsFixed(0)} kcal"
                  : ''),
          style: const TextStyle(color: Colors.white60),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.white54),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ExerciseDetailPage(exercise: exercise),
            ),
          );
        },
      ),
    );
  }

  Widget _routineCard(RoutineModel routine, ExerciseProvider exerciseProvider) {
    final local = AppLocalizations.of(context)!;
    final rExercises = exerciseProvider.getExercisesForRoutine(routine.id);
    final preview = rExercises.take(3).map((e) => e.name).join(', ');
    final calories = rExercises.fold(
      0.0,
      (a, e) => a + (e.caloriesBurnedEstimate ?? 0.0),
    );
    final duration = rExercises.fold(
      Duration.zero,
      (a, e) => a + (e.duration ?? Duration.zero),
    );

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => RoutineDetailPage(routine: routine),
          ),
        );
      },
      child: Card(
        color: Colors.white12,
        margin: const EdgeInsets.symmetric(vertical: 6),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      routine.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white38,
                    size: 16,
                  ),
                ],
              ),
              if (routine.description != null &&
                  routine.description!.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    routine.description!,
                    style: const TextStyle(color: Colors.white60),
                  ),
                ),
              if (preview.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    local.workoutDetail_routineExercisesLabel(preview),
                    style: const TextStyle(color: Colors.white60),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Text(
                  local.workoutDetail_routineTimeLabel(
                    _formatDuration(duration),
                  ),
                  style: const TextStyle(color: Colors.white60),
                ),
              ),
              Text(
                local.workoutDetail_routineCaloriesLabel(
                  calories.toStringAsFixed(0),
                ),
                style: const TextStyle(color: Colors.white60),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatDuration(Duration? duration) {
    if (duration == null) {
      return AppLocalizations.of(context)!.workoutDetail_durationUndefined;
    }
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return hours > 0 ? "${hours}h ${minutes}m" : "${minutes}m";
  }

  double _calculateTotalCaloriesIncludingRoutines(
    List<ExerciseModel> workoutExercises,
    List<RoutineModel> routines,
    ExerciseProvider exerciseProvider,
  ) {
    double sum = workoutExercises.fold(
      0.0,
      (a, e) => a + (e.caloriesBurnedEstimate ?? 0.0),
    );
    for (final r in routines) {
      final rExercises = exerciseProvider.getExercisesForRoutine(r.id);
      sum += rExercises.fold(
        0.0,
        (a, e) => a + (e.caloriesBurnedEstimate ?? 0.0),
      );
    }
    return sum;
  }

  Duration _calculateTotalDurationIncludingRoutines(
    List<ExerciseModel> workoutExercises,
    List<RoutineModel> routines,
    ExerciseProvider exerciseProvider,
  ) {
    Duration sum = workoutExercises.fold(
      Duration.zero,
      (a, e) => a + (e.duration ?? Duration.zero),
    );
    for (final r in routines) {
      final rExercises = exerciseProvider.getExercisesForRoutine(r.id);
      sum += rExercises.fold(
        Duration.zero,
        (a, e) => a + (e.duration ?? Duration.zero),
      );
    }
    return sum;
  }
}
