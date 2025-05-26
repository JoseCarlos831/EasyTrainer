// lib/src/screens/public/login_page.dart
import 'package:flutter/material.dart';
import 'package:personalapp/l10n/app_localizations.dart';

import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import '../../providers/auth_provider.dart';
import '../../widgets/social_login_button.dart';
import '../../widgets/password_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final local = AppLocalizations.of(context)!;

    return Scaffold(
      body: Stack(
        children: [
          _backgroundImage(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 60),
                    _backButton(),
                    const SizedBox(height: 20),
                    Text(
                      local.loginPage_welcomeMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 30),
                    _textField(
                      local.loginPage_emailHint,
                      controller: _emailController,
                    ),
                    const SizedBox(height: 20),
                    PasswordTextField(
                      hintText: local.loginPage_passwordHint,
                      controller: _passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return local.loginPage_validatorPasswordRequired;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextButton(
                      onPressed: () => Navigator.pushNamed(context, '/forgot'),
                      child: Text(
                        local.loginPage_forgotPasswordLink,
                        style: const TextStyle(color: Colors.lightBlueAccent),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        if (!_formKey.currentState!.validate()) return;

                        final authProvider = Provider.of<AuthProvider>(
                          context,
                          listen: false,
                        );
                        final success = await authProvider.login(
                          _emailController.text.trim(),
                          _passwordController.text,
                          role: 'user',
                        );

                        if (!mounted) return;
                        if (success) {
                          Navigator.pushReplacementNamed(
                            context,
                            '/initializing',
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      child: Text(
                        local.loginPage_signInButton,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      local.loginPage_orLoginWith,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 10),
                    _socialButtons(),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          local.loginPage_registerPrompt,
                          style: const TextStyle(color: Colors.white70),
                        ),
                        TextButton(
                          onPressed:
                              () => Navigator.pushNamed(context, '/register'),
                          child: Text(
                            local.loginPage_registerNowLink,
                            style: const TextStyle(
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
            ),
          ),
        ],
      ),
    );
  }

  Widget _backgroundImage() {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage('assets/imagem/TelaLogin.png'),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5),
            BlendMode.darken,
          ),
        ),
      ),
    );
  }

  Widget _backButton() {
    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        icon: const Icon(Icons.arrow_back, color: Colors.white, size: 30),
        onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            SystemNavigator.pop();
          }
        },
      ),
    );
  }

  Widget _textField(
    String hint, {
    bool obscure = false,
    required TextEditingController controller,
  }) {
    final local = AppLocalizations.of(context)!;

    return TextFormField(
      controller: controller,
      obscureText: obscure,
      style: const TextStyle(color: Colors.white),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return local.loginPage_validatorFieldRequired(hint);
        }
        if (hint.toLowerCase().contains("email") &&
            !RegExp(r'^[\w\.-]+@[\w\.-]+\.\w{2,4}$').hasMatch(value)) {
          return local.loginPage_validatorEmailInvalid;
        }
        return null;
      },
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white.withOpacity(0.2),
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white70),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon:
            obscure
                ? const Icon(Icons.visibility, color: Colors.white70)
                : null,
      ),
    );
  }

  Widget _socialButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialLoginButton(icon: Icons.facebook, color: Colors.blue),
        SizedBox(width: 15),
        SocialLoginButton(icon: Icons.g_mobiledata, color: Colors.white),
        SizedBox(width: 15),
        SocialLoginButton(icon: Icons.apple, color: Colors.white),
      ],
    );
  }
}
