
import 'package:flutter/material.dart';

class RoutineSection extends StatelessWidget {
  const RoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Workout Plan",
            style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
        const SizedBox(height: 12),
        _workoutCard("Muscular Workout", "Upper Back", "assets/workout1.png", 0.75),
        const SizedBox(height: 16),
        _workoutCard("Muscular Workout", "Upper Back", "assets/workout2.png", 0.45),
      ],
    );
  }

  Widget _workoutCard(String title, String subtitle, String imagePath, double progress) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: const Color(0xFF1C1732),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(left: Radius.circular(16)),
            child: Image.asset(imagePath, width: 120, height: 150, fit: BoxFit.cover),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(subtitle, style: const TextStyle(color: Colors.white70)),
                  const Spacer(),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 40,
                        height: 40,
                        child: CircularProgressIndicator(
                          value: progress,
                          backgroundColor: Colors.white24,
                          valueColor: const AlwaysStoppedAnimation(Colors.tealAccent),
                          strokeWidth: 4,
                        ),
                      ),
                      Text("${(progress * 100).toInt()}%",
                          style: const TextStyle(color: Colors.white)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
