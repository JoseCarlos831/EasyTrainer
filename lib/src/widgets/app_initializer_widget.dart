// lib/src/widgets/app_initializer_widget.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/auth_provider.dart';

class AppInitializer extends StatefulWidget {
  final Widget child;

  const AppInitializer({super.key, required this.child});

  @override
  State<AppInitializer> createState() => _AppInitializerState();
}

class _AppInitializerState extends State<AppInitializer> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<AuthProvider>(context, listen: false).tryAutoLogin());
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
