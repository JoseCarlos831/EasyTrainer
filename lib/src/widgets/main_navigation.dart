import 'package:flutter/material.dart';

import '../screens/private/home/home_page.dart';
import '../screens/private/analytics_page.dart';
import '../screens/private/profile_page.dart';

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AnalyticsPage(), 
    ProfileScreen(),
  ];

  final List<String> _labels = ["Home", "Analytics", "Profile"];
  final List<IconData> _icons = [Icons.home, Icons.analytics_outlined, Icons.person];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: _pages[_selectedIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          height: 70,
          decoration: BoxDecoration(
            color: const Color(0xFF1C1732),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(3, (index) {
              final bool isSelected = index == _selectedIndex;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.tealAccent.withOpacity(0.1) : Colors.transparent,
                    borderRadius: BorderRadius.circular(30),
                    border: isSelected
                        ? Border.all(color: Colors.tealAccent)
                        : Border.all(color: Colors.transparent),
                  ),
                  child: Row(
                    children: [
                      Icon(_icons[index],
                          color: isSelected ? Colors.tealAccent : Colors.white),
                      if (isSelected) ...[
                        const SizedBox(width: 8),
                        Text(
                          _labels[index],
                          style: const TextStyle(color: Colors.tealAccent),
                        ),
                      ],
                    ],
                  ),
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
