import 'package:flutter/material.dart';
import 'routine_section.dart';
import 'workout_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;
  int _selectedDay = 1;

  final List<String> _days = [
    'Wed 21', 'Thu 22', 'Fri 23', 'Sat 24', 'Sun 25', 'Mon 26'
  ];

  void _Notifications() async {
    final notifications = await _mockNotifications();

    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1C1732),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Notificações",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 12),
            ...notifications.map((n) => ListTile(
                  title: Text(n.title, style: const TextStyle(color: Colors.white)),
                  subtitle: Text(n.body, style: const TextStyle(color: Colors.white70)),
                  trailing: Text(
                    "${n.date.hour}:${n.date.minute.toString().padLeft(2, '0')}",
                    style: const TextStyle(color: Colors.white38, fontSize: 12),
                  ),
                )),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildSearchBar(),
              const SizedBox(height: 20),
              _buildTabs(),
              const SizedBox(height: 20),
              _buildDaysSelector(),
              const SizedBox(height: 20),
              _selectedTab == 0 ? const RoutineSection() : const WorkoutSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                'https://images.unsplash.com/photo-1614283254649-bf98d3d7bb9a?auto=format&fit=crop&w=500&q=60',
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text('Hi, Jonathan',
                    style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                Text("What's your plan for today?",
                    style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ],
        ),
        IconButton(
          icon: const Icon(Icons.notifications_none, color: Colors.white),
          onPressed: _Notifications,
        ),
      ],
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
        _tabItem(0, Icons.event_note, "Routine"),
        const SizedBox(width: 20),
        _tabItem(1, Icons.fitness_center, "Workout"),
      ],
    );
  }

  Widget _tabItem(int index, IconData icon, String label) {
    final bool selected = _selectedTab == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedTab = index),
      child: Column(
        children: [
          Icon(icon, color: selected ? Colors.tealAccent : Colors.white54, size: 30),
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