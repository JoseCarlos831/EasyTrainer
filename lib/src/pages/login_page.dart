import 'package:flutter/material.dart';
import 'package:personalapp/src/widgets/social_login_button.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
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
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Welcome back!\nGlad to see you, Again!",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 30),
                _textField("Enter your email"),
                SizedBox(height: 20),
                _textField("Enter your password", obscure: true),
                SizedBox(height: 20),
                TextButton(
  onPressed: () => Navigator.pushNamed(context, '/forgot'),
  child: Text(
    "Forgot Password?",
    style: TextStyle(color: Colors.lightBlueAccent,),
  ),
),
SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    minimumSize: Size(double.infinity, 50),
                  ),
                  child: Text("Sign in", style: TextStyle(color: Colors.white,fontSize: 18, fontWeight: FontWeight.bold)),
                ),
                SizedBox(height: 20),
                Text("Or Login with", style: TextStyle(color: Colors.white70)),
                SizedBox(height: 10),
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
                SizedBox(height: 20),
                Row(
  mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Text(
      "Don't have an account?",
      style: TextStyle(color: Colors.white70),
    ),
    TextButton(
      onPressed: () => Navigator.pushNamed(context, '/register'),
      child: Text(
        "Register Now",
        style: TextStyle(
          color: Colors.lightBlueAccent,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  ],
),

              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _textField(String hint, {bool obscure = false}) {
    return TextField(
      obscureText: obscure,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: obscure ? Icon(Icons.visibility, color: Colors.white70) : null,
      ),
    );
  }
}
