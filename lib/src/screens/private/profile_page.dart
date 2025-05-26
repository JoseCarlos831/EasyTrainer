// lib/src/screens/private/profile_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:personalapp/l10n/app_localizations.dart';


import '../../providers/auth_provider.dart';
import '../../providers/exercise_provider.dart';
import '../../providers/modality_provider.dart';
import '../../providers/user_provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.watch<UserProvider>().user;
    final local = AppLocalizations.of(context)!;

    if (user == null) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Text(
                local.profilePage_title,
                style: const TextStyle(
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
                user.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 5),

              Text(
                user.email,
                style: const TextStyle(fontSize: 14, color: Colors.white70),
              ),

              const SizedBox(height: 30),

              ProfileOption(
                icon: Icons.edit_note,
                label: local.profilePage_editProfile,
                onTap: () => Navigator.pushNamed(context, '/edit-profile'),
              ),
              ProfileOption(
                icon: Icons.settings,
                label: local.profilePage_settings,
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
              ProfileOption(
                icon: Icons.logout,
                label: local.profilePage_logout,
                onTap: () => _signOut(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _signOut(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(local.profilePage_logoutDialogTitle),
            content: Text(local.profilePage_logoutDialogMessage),
            actions: [
              TextButton(
                onPressed: () async {
                  Navigator.pop(context); // fecha o dialog

                  context.read<UserProvider>().clear();
                  context.read<ExerciseProvider>().clear();
                  context.read<ModalityProvider>().clear();

                  await context.read<AuthProvider>().logout();
                },
                child: Text(local.profilePage_logoutConfirmButton),
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
