import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0B0622), // Cor de fundo roxo escuro
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              // Botão de voltar

              // Título
              Text(
                "Perfil",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 30),

              // Foto de Perfil
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.white24,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          shape: BoxShape.circle,
                        ),
                        child: IconButton(
                          icon: Icon(Icons.edit, size: 25, color: Colors.white),
                          onPressed: () {
                            Navigator.pushNamed(context, '/edit-profile');
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Nome
              Text(
                "Ayomide Grace",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),

              // Email
              Text(
                "ayomide.grace589567@gmail.com",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white70,
                ),
              ),
              SizedBox(height: 30),

              // Itens de Menu
              ProfileOption(
                icon: Icons.edit_note,
                label: "Editar Perfil",
                onTap: () => Navigator.pushNamed(context, '/edit-profile'),
              ),
              ProfileOption(
                icon: Icons.settings,
                label: "Configuraçao",
                onTap: () => Navigator.pushNamed(context, '/settings'),
              ),
              ProfileOption(
                icon: Icons.logout,
                label: "Sair",
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
      builder: (context) => AlertDialog(
        title: Text('Sair'),
        content: Text('Deseja Realmente Sair?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancelar'),
          ),
          TextButton(
            onPressed: () {
              // Aqui você pode adicionar lógica de logout
              Navigator.pushNamedAndRemoveUntil(context, '/login', (route) => false);
            },
            child: Text('Confirmar'),
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
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          decoration: BoxDecoration(
            color: Color(0xFF1C1732), // tom mais claro de roxo para o container
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
      ),
    );
  }
}
