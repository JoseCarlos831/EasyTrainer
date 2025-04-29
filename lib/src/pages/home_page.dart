import 'package:flutter/material.dart'; 

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTab = 0;    // 0 = Routine, 1 = Workout
  int _selectedDay = 1;    // índice do dia selecionado

  final List<String> _days = [
    'Wed 21', 'Thu 22', 'Fri 23', 'Sat 24', 'Sun 25', 'Mon 26'
  ];

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
              _selectedTab == 0 ? _buildWorkoutSection() : _buildTrainingAndExercises(),
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
                  'https://images.unsplash.com/photo-1614283254649-bf98d3d7bb9a?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8d29tYW58ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Hi, Jonathan',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
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
          onPressed: () {},
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
      onTap: () {
        setState(() {
          _selectedTab = index;
        });
      },
      child: Column(
        children: [
          Icon(icon,
              color: selected ? Colors.tealAccent : Colors.white54, size: 30),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
                color: selected ? Colors.tealAccent : Colors.white54,
                fontWeight: FontWeight.bold),
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
            onTap: () {
              setState(() {
                _selectedDay = index;
              });
            },
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

  Widget _buildWorkoutSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Workout Plan",
          style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        _workoutCard('Muscular Workout', 'Upper Back', 'assets/workout1.png', 0.75),
        const SizedBox(height: 16),
        _workoutCard('Muscular Workout', 'Upper Back', 'assets/workout2.png', 0.45),
      ],
    );
  }

  Widget _buildTrainingAndExercises() {
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
      const Text(
        "Training",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),

      // Categorias
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
      const Text(
        "Exercises",
        style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 12),

      // Exercícios
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
                      Text('${(progress * 100).toInt()}%',
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
