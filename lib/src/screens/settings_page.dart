import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0622), // Fundo roxo escuro
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Botão de voltar
              Align(
                alignment: Alignment.centerLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 30),
                  onPressed: () => Navigator.pop(context),
                ),
              ),
              SizedBox(height: 10),

              // Título
              Text(
                "Configuração",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 30),

              // Opções de Configuração
              SettingOption(
                icon: Icons.lock,
                label: "Atualizar a Senha",
                onTap: () => Navigator.pushNamed(context, '/password-settings'),
              ),
              SizedBox(height: 20),
              SettingOption(
                icon: Icons.person,
                label: "Deletar Conta",
                onTap: () => Navigator.pushNamed(context, '/delete-account'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SettingOption extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const SettingOption({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
        decoration: BoxDecoration(
          color: Color(0xFF1C1732), // cor dos cards
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.tealAccent, size: 26),
            SizedBox(width: 15),
            Expanded(
              child: Text(
                label,
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.white70, size: 16),
          ],
        ),
      ),
    );
  }
}
