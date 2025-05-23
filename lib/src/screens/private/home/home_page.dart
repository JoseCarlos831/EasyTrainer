// lib/src/screens/private/home/home_page.dart

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../providers/auth_provider.dart';
import '../../../providers/exercise_provider.dart';
import '../../../providers/modality_provider.dart';
import '../../../providers/user_provider.dart';
import '../../../providers/workout_provider.dart';

import 'exercise_section.dart';
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
  bool _redirected = false;
  bool _ready = false;

  late Future<void> _initialLoadFuture;
  int _selectedTab = 0;
  int _selectedDay = 0;

  late final List<String> _days;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();

    _days = List.generate(7, (index) {
      final date = DateTime.now().add(Duration(days: index));
      return DateFormat('E dd').format(date);
    });

    _initialLoadFuture = _loadInitialData().then((_) {
      if (mounted) {
        setState(() {
          _ready = true;
        });
      }
    });
  }

  void _showNotifications() async {
    final local = AppLocalizations.of(context)!;
    final notifications = await _mockNotifications(local);

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
                Text(
                  local.homePage_notificationsTitle,
                  style: const TextStyle(
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

  Future<List<AppNotification>> _mockNotifications(
    AppLocalizations local,
  ) async {
    await Future.delayed(const Duration(milliseconds: 600));
    return [
      AppNotification(
        title: local.homePage_notificationWorkoutTitle,
        body: local.homePage_notificationWorkoutBody,
        date: DateTime.now(),
      ),
      AppNotification(
        title: local.homePage_notificationGoalTitle,
        body: local.homePage_notificationGoalBody,
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
      await workoutProvider.fetchUserWorkouts(userId, token);
      await modalityProvider.fetchModalities(token);

      for (final workout in workoutProvider.userWorkouts) {
        final workoutId = workout.id;
        final instructorId = workout.instructorId;

        if (workoutId > 0 && instructorId > 0) {
          await exerciseProvider.fetchExercisesByWorkoutId(
            workoutId,
            instructorId,
            token,
          );
        }
      }

      final allExercises = exerciseProvider.allExercises;
      final usedModalityIds = allExercises.expand((e) => e.modalityIds).toSet();

      if (usedModalityIds.isNotEmpty) {
        await modalityProvider.fetchMissingModalities(
          usedModalityIds.toList(),
          token,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;
    final user = context.watch<UserProvider>().user;

    if (!_ready) {
      return const Scaffold(
        backgroundColor: Color(0xFF0B0622),
        body: Center(child: CircularProgressIndicator()),
      );
    }

    if (user == null && !_redirected) {
      _redirected = true;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          Navigator.pushReplacementNamed(context, '/login');
        }
      });

      return const Scaffold(
        backgroundColor: Color(0xFF0B0622),
        body: Center(child: CircularProgressIndicator()),
      );
    }

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
              return Center(
                child: Text(
                  local.homePage_errorLoadingMessage,
                  style: const TextStyle(color: Colors.redAccent),
                ),
              );
            }

            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildHeader(local),
                  const SizedBox(height: 20),
                  _buildDynamicTitle(local),
                  const SizedBox(height: 20),
                  _buildSearchBar(local),
                  const SizedBox(height: 20),
                  _buildTabs(local),
                  const SizedBox(height: 20),
                  _buildDaysSelector(),
                  const SizedBox(height: 20),
                  _selectedTab == 0
                      ? WorkoutSection(
                        key: const PageStorageKey('workout_section'),
                        searchQuery: _searchQuery,
                      )
                      : ExerciseSection(
                        key: const PageStorageKey('exercise_section'),
                        searchQuery: _searchQuery,
                      ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildHeader(AppLocalizations local) {
    final user = context.watch<AuthProvider>().userData;
    final name = user?['name'] ?? 'User';
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
                  local.homePage_greeting(name),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  local.homePage_planPrompt,
                  style: const TextStyle(color: Colors.white70, fontSize: 14),
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

  Widget _buildDynamicTitle(AppLocalizations local) {
    final title =
        _selectedTab == 0
            ? local.homePage_sectionWorkoutTitle
            : local.homePage_sectionExercisesTitle;
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

  Widget _buildSearchBar(AppLocalizations local) {
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
              decoration: InputDecoration(
                hintText: local.homePage_searchHint,
                hintStyle: const TextStyle(color: Colors.white38),
                border: InputBorder.none,
              ),
              onChanged: (value) => setState(() => _searchQuery = value),
            ),
          ),
          const Icon(Icons.filter_list, color: Colors.white70),
        ],
      ),
    );
  }

  Widget _buildTabs(AppLocalizations local) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _tabItem(0, Icons.fitness_center, local.homePage_tabWorkout),
        const SizedBox(width: 20),
        _tabItem(1, Icons.event_note, local.homePage_tabExercises),
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
