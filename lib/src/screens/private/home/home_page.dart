// lib/src/screens/private/home/home_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/exercise_provider.dart';
import '../../../providers/modality_provider.dart';
import '../../../providers/workout_provider.dart';

import 'routine_section.dart';
import 'workout_section.dart';

class AppNotification {
  final String title;
  final String body;
  final DateTime date;

  AppNotification({
    required this.title,
    required this.body,
    required this.date,
  });
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<void> _initialLoadFuture;
  int _selectedTab = 0;
  int _selectedDay = 0;

  late final List<String> _days;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _initialLoadFuture = _loadInitialData();
    _days = List.generate(7, (index) {
      final date = DateTime.now().add(Duration(days: index));
      return DateFormat('E dd').format(date);
    });
  }

  void _showNotifications() async {
    final notifications = await _mockNotifications();

    if (!mounted) return;

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1732),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder:
          (_) => Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  "Notificações",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                ...notifications.map(
                  (n) => ListTile(
                    title: Text(
                      n.title,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      n.body,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    trailing: Text(
                      "${n.date.hour}:${n.date.minute.toString().padLeft(2, '0')}",
                      style: const TextStyle(
                        color: Colors.white38,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
    );
  }

  Future<List<AppNotification>> _mockNotifications() async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      AppNotification(
        title: 'Treino Novo',
        body: 'Seu treino de costas foi atualizado',
        date: DateTime.now(),
      ),
      AppNotification(
        title: 'Meta batida!',
        body: 'Você completou 80% dos treinos da semana.',
        date: DateTime.now(),
      ),
    ];
  }


  Future<void> _loadInitialData() async {
    final auth = context.read<AuthProvider>();
    final workoutProvider = context.read<WorkoutProvider>();
    final modalityProvider = context.read<ModalityProvider>();
    final exerciseProvider = context.read<ExerciseProvider>();

    final userId = auth.userData?['id'];
    final token = auth.token;

    if (userId != null && token != null) {
      print('[HomePage] Carregando workouts e modalities para userId=$userId');

      // Carrega primeiro os dados principais
      await workoutProvider.fetchUserWorkouts(userId, token);
      await modalityProvider.fetchModalities(token);

      // Agora carrega os exercícios associados
      for (final workout in workoutProvider.userWorkouts) {
        final workoutId = workout.id;
        final instructorId = workout.instructorId;

        if (workoutId > 0 && instructorId > 0) {
          await exerciseProvider.fetchExercisesByWorkoutId(
            workoutId,
            instructorId,
            token,
          );
        } else {
          print(
            '[HomePage] Workout inválido — id: $workoutId, instructorId: $instructorId',
          );
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: FutureBuilder(
          future: _initialLoadFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }

            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Erro ao carregar dados. Verifique sua conexão.',
                  style: TextStyle(color: Colors.redAccent),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(),
                  const SizedBox(height: 20),
                  _buildDynamicTitle(),
                  const SizedBox(height: 20),
                  _buildSearchBar(),
                  const SizedBox(height: 20),
                  _buildTabs(),
                  const SizedBox(height: 20),
                  _buildDaysSelector(),
                  const SizedBox(height: 20),
                  _selectedTab == 0
                      ? WorkoutSection(searchQuery: _searchQuery)
                      : RoutineSection(searchQuery: _searchQuery),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader() {
    final user = context.watch<AuthProvider>().userData;
    final name = user?['name'] ?? 'Usuário';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundColor: Colors.tealAccent,
              child: Icon(Icons.person, color: Colors.white, size: 30),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi, $name',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "What's your plan for today?",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: _showNotifications,
        ),
      ],
    );
  }

  Widget _buildDynamicTitle() {
    final title = _selectedTab == 0 ? "My Workout" : "My Routine";
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white54,
        ),
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1C1732),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.white70),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              style: const TextStyle(color: Colors.white),
              decoration: const InputDecoration(
                hintText: "Search Here",
                hintStyle: TextStyle(color: Colors.white38),
                border: InputBorder.none,
              ),
              onChanged: (value) {
                setState(() {
                  _searchQuery = value;
                });
              },
            ),
          ),
          const Icon(Icons.filter_list, color: Colors.white70),
        ],
      ),
    );
  }


  Widget _buildTabs() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tabItem(0, Icons.fitness_center, "Workout"),
        const SizedBox(width: 20),
        _tabItem(1, Icons.event_note, "Routine"),
      ],
    );
  }

  Widget _tabItem(int index, IconData icon, String label) {
    final bool selected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Column(
        children: [
          Icon(
            icon,
            color: selected ? Colors.tealAccent : Colors.white54,
            size: 30,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: selected ? Colors.tealAccent : Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDaysSelector() {
    return SizedBox(
      height: 40,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _days.length,
        semanticChildCount: _days.length,
        itemBuilder: (context, index) {
          final bool selected = index == _selectedDay;
          return GestureDetector(
            onTap: () => setState(() => _selectedDay = index),
            child: Container(
              margin: const EdgeInsets.only(right: 12),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: selected ? Colors.tealAccent : const Color(0xFF1C1732),
                borderRadius: BorderRadius.circular(12),
              ),
              alignment: Alignment.center,
              child: Text(
                _days[index],
                style: TextStyle(
                  color: selected ? Colors.black : Colors.white70,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
