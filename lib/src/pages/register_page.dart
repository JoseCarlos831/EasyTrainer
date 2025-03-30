import 'package:flutter/material.dart';
import 'package:personalapp/src/widgets/social_login_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;

  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      print("Usuário registrado: ${_usernameController.text}");
      // Aqui vai a lógica de integração com backend/Firebase
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Imagem de fundo
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/imagem/TelaLogin.png'),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5),
                  BlendMode.darken,
                ),
              ),
            ),
          ),

          // Conteúdo principal
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    // Botão de voltar
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 10, left: 5),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                          onPressed: () => Navigator.pop(context),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),

                    // Título
                    Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 30),

                    _buildTextField(_usernameController, "Username"),
                    SizedBox(height: 15),
                    _buildTextField(_emailController, "Email", email: true),
                    SizedBox(height: 15),
                    _buildTextField(_passwordController, "Password", isPassword: true, obscure: _obscurePassword, toggle: () {
                      setState(() => _obscurePassword = !_obscurePassword);
                    }),
                    SizedBox(height: 15),
                    _buildTextField(_confirmPasswordController, "Confirm password", isPassword: true, obscure: _obscureConfirmPassword, toggle: () {
                      setState(() => _obscureConfirmPassword = !_obscureConfirmPassword);
                    }),
                    SizedBox(height: 25),

                    // Botão de registro
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: _register,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text(
                          "Agree and Register",
                          style: TextStyle(color: Colors.white ,fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),

                    // Texto "Ou login com"
                    Center(
                      child: Text(
                        "Or Login with",
                        style: TextStyle(color: Colors.white70),
                      ),
                    ),
                    SizedBox(height: 15),

                    // Botões sociais
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SocialLoginButton(icon: Icons.facebook, color: Colors.blue),
                        SizedBox(width: 15),
                        SocialLoginButton(icon: Icons.g_mobiledata, color: Colors.white),
                        SizedBox(width: 15),
                        SocialLoginButton(icon: Icons.apple, color: Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(
    TextEditingController controller,
    String hint, {
    bool isPassword = false,
    bool email = false,
    bool obscure = false,
    VoidCallback? toggle,
  }) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      keyboardType: email ? TextInputType.emailAddress : TextInputType.text,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: Icon(
                  obscure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white70,
                ),
                onPressed: toggle,
              )
            : null,
      ),
      validator: (value) {
        if (value == null || value.isEmpty) return 'Enter $hint';
        if (hint == "Confirm password" && value != _passwordController.text) {
          return 'Passwords do not match';
        }
        return null;
      },
    );
  }
}
