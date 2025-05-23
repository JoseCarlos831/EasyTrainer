// lib/src/screens/private/language_selection_page.dart

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../providers/language_provider.dart';

class LanguageSelectionPage extends StatelessWidget {
  const LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text(local.settingsPage_changeLanguage),
      ),
      body: ListView(
        children: [
          _languageTile(context, 'English', 'en'),
          _languageTile(context, 'Português', 'pt'),
        ],
      ),
    );
  }

  Widget _languageTile(BuildContext context, String title, String code) {
    final currentLocale = Localizations.localeOf(context).languageCode;
    final isSelected = currentLocale == code;

    return ListTile(
      leading: const Icon(Icons.language, color: Colors.tealAccent),
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing:
          isSelected ? const Icon(Icons.check, color: Colors.tealAccent) : null,
      onTap: () async {
        final provider = context.read<LanguageProvider>();
        await provider.setLocale(Locale(code));
        Navigator.pop(context);
      },
    );
  }
}
