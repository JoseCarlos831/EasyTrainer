import 'package:flutter/material.dart';

class WorkoutSection extends StatelessWidget {
  const WorkoutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> categories = [
      {'label': 'Upper Back', 'icon': Icons.fitness_center},
      {'label': 'Pectoral', 'icon': Icons.sports_gymnastics},
      {'label': 'Shoulder', 'icon': Icons.accessibility_new},
      {'label': 'Legs', 'icon': Icons.directions_run},
      {'label': 'Full Body', 'icon': Icons.accessibility},
    ];

    final List<Map<String, dynamic>> exercises = [
      {
        'title': 'High Pulley Crossover',
        'image': 'assets/exercise1.png',
        'series': '4x',
        'reps': '10rp',
        'rest': '1:30 min',
        'done': true,
      },
      {
        'title': 'Supino Inclinado',
        'image': 'assets/exercise2.png',
        'series': '3x',
        'reps': '8rp',
        'rest': '2.00 min',
        'done': true,
      },
      {
        'title': 'Supino Reto',
        'image': 'assets/exercise3.png',
        'series': '3x',
        'reps': '8rp',
        'rest': '2.00 min',
        'done': false,
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 24),
        const Text("Training",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        SizedBox(
        height: 90,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (_, __) => SizedBox(width: 12),
          itemBuilder: (context, i) {
            return Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.tealAccent.withOpacity(0.1),
                  child: Icon(categories[i]['icon'], color: Colors.tealAccent),
                ),
                SizedBox(height: 6),
                Text(categories[i]['label'],
                    style: TextStyle(color: Colors.white70, fontSize: 12)),
              ],
            );
          },
        ),
      ),
        const SizedBox(height: 20),
        const Text("Exercises",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        ...exercises.map((ex) => _exerciseCard(ex)).toList(),
      ],
    );
  }

  Widget _exerciseCard(Map<String, dynamic> ex) {
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
          child: Image.asset(
            ex['image'],
            width: 90,
            height: 90,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(ex['title'],
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              const SizedBox(height: 6),
              Row(
                children: [
                  _infoText("Séries", ex['series']),
                  _infoText("Repetições", ex['reps']),
                  _infoText("Descanso", ex['rest']),
                ],
              ),
            ],
          ),
        ),
        if (ex['done'])
          const Icon(Icons.check_circle, color: Colors.tealAccent),
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
          Text(label, style: const TextStyle(color: Colors.white54, fontSize: 10)),
          Text(value, style: const TextStyle(color: Colors.white, fontSize: 12)),
        ],
      ),
    );
  }
}
