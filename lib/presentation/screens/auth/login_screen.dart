
// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const TextStyle loginTextStyle = TextStyle(
  fontSize: 42, // Tamaño del texto
  fontWeight: FontWeight.w400, // Negrita
  decorationStyle: TextDecorationStyle.solid,
  decoration: TextDecoration.underline
);

class LoginScreen extends StatefulWidget {
  static const String name = 'login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool emailError = false;
  bool passwordError = false;
  bool canLogin = false; // Variable para habilitar/deshabilitar el botón de inicio de sesión

  void validateEmail(String value) {
    setState(() {
      emailError = !value.contains("@alu.ulpgc.es");
      checkCanLogin(); // Verificar si se puede iniciar sesión
    });
  }

  void validatePassword(String value) {
    setState(() {
      passwordError = value.length < 6;
      checkCanLogin(); // Verificar si se puede iniciar sesión
    });
  }

  // Función para verificar si se puede iniciar sesión
  void checkCanLogin() {
    setState(() {
      canLogin = !emailError && !passwordError && passwordController.text.length >= 6 ;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Login',
                style: loginTextStyle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  errorText: emailError ? 'Email must be @alu.ulpgc.es' : null,
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onChanged: validateEmail,
                onEditingComplete: () => validateEmail(emailController.text),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  errorText: passwordError ? 'Length of password must be >= 6' : null,
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.red),
                  ),
                ),
                onChanged: validatePassword,
                onEditingComplete: () => validatePassword(passwordController.text),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: canLogin // Solo habilita el botón si los campos están validados
                    ? () {
                        // Your login logic here
                        GoRouter.of(context).go('/main');
                      }
                    : null,
                child: const Text('Get me in!'),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Action when tapping on the registration text
                  GoRouter.of(context).go('/signin');
                },
                child: const Text(
                  'Do not have an account yet?, Create it here!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
