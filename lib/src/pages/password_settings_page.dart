import 'package:flutter/material.dart';

class PasswordSettingsPage extends StatefulWidget {
  const PasswordSettingsPage({super.key});

  @override
  State<PasswordSettingsPage> createState() => _PasswordSettingsPageState();
}

class _PasswordSettingsPageState extends State<PasswordSettingsPage> {
  final _currentPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscureCurrent = true;
  bool _obscureNew = true;
  bool _obscureConfirm = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _changePassword() {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("New passwords do not match")),
      );
      return;
    }
    // Aqui você enviaria a atualização de senha ao servidor
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Password changed successfully!")),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0B0622),
      body: SafeArea(
        child: SingleChildScrollView(
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
                "Atualizar a Senha",
                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 30),

              // Campo: Current Password
              _buildPasswordField(
                label: "Senha Atual",
                controller: _currentPasswordController,
                obscure: _obscureCurrent,
                toggle: () => setState(() => _obscureCurrent = !_obscureCurrent),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/forgot');
                  },
                  child: Text(
                    "Esqueci a Senha?",
                    style: TextStyle(color: Colors.lightBlueAccent),
                  ),
                ),
              ),
              SizedBox(height: 10),

              // Campo: New Password
              _buildPasswordField(
                label: "Nova Senha",
                controller: _newPasswordController,
                obscure: _obscureNew,
                toggle: () => setState(() => _obscureNew = !_obscureNew),
              ),
              SizedBox(height: 20),

              // Campo: Confirm New Password
              _buildPasswordField(
                label: "Confimar a Senha",
                controller: _confirmPasswordController,
                obscure: _obscureConfirm,
                toggle: () => setState(() => _obscureConfirm = !_obscureConfirm),
              ),
              SizedBox(height: 40),

              // Botão Change Password
              SizedBox(
                width: double.infinity,
                height: 50,
                child: OutlinedButton(
                  onPressed: _changePassword,
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.tealAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Atualizar a Senha",
                    style: TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPasswordField({
    required String label,
    required TextEditingController controller,
    required bool obscure,
    required VoidCallback toggle,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: label,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.1),
        suffixIcon: IconButton(
          icon: Icon(
            obscure ? Icons.visibility_off : Icons.visibility,
            color: Colors.tealAccent,
          ),
          onPressed: toggle,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
