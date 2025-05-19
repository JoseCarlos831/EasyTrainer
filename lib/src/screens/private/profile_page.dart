// lib/src/screens/private/profile_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/auth_provider.dart';
import '../../providers/exercise_provider.dart';
import '../../providers/modality_provider.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const Text(
                "Profile",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              const CircleAvatar(
                radius: 50,
                backgroundColor: Colors.tealAccent,
                child: Icon(Icons.person, color: Colors.white, size: 50),
              ),

              const SizedBox(height: 15),

              Text(
                user?.name ?? "User",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                user?.email ?? "email@example.com",
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),

              const SizedBox(height: 30),

              ProfileOption(
                icon: Icons.edit_note,
                label: "Edit Profile",
                onTap: () => Navigator.pushNamed(context, '/edit-profile'),
              ),
              ProfileOption(
                icon: Icons.settings,
                label: "Settings",
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
              ProfileOption(
                icon: Icons.logout,
                label: "Log Out",
                onTap: () => _signOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Log Out'),
            content: const Text('Are you sure you want to log out?'),
            actions: [
              TextButton(
                onPressed: () async {
                  final authProvider = Provider.of<AuthProvider>(
                    context,
                    listen: false,
                  );
                  final userProvider = Provider.of<UserProvider>(
                    context,
                    listen: false,
                  );
                  final exerciseProvider = Provider.of<ExerciseProvider>(
                    context,
                    listen: false,
                  );
                  final modalityProvider = Provider.of<ModalityProvider>(
                    context,
                    listen: false,
                  );

                  await authProvider.logout();
                  userProvider.clear();
                  exerciseProvider.clear();
                  modalityProvider.clear();

                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    '/login',
                    (route) => false,
                  );
                },
                child: const Text('Confirm'),
              ),
            ],
          ),
    );
  }
}

class ProfileOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ProfileOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          decoration: BoxDecoration(
            color: const Color(0xFF1C1732),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            children: [
              Icon(icon, color: Colors.tealAccent, size: 26),
              const SizedBox(width: 15),
              Expanded(
                child: Text(
                  label,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
