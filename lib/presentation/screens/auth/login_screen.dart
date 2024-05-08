import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginScreen extends StatelessWidget {
  static const String name = 'login-screen';
  

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(labelText: 'Password'),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Captura el valor del correo electrónico y la contraseña
                  String email = emailController.text;
                  String password = passwordController.text;

                  // Verifica si el correo electrónico contiene el dominio "@alu.ulpgc.es"
                  if (!email.contains("@alu.ulpgc.es")) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Email must be @alu.ulpgc.es')),
                    );
                    return; // Detiene la ejecución del resto del código
                  }

                  // Verifica si la contraseña tiene una longitud mínima de 6 caracteres
                  if (password.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Length of password must be >= 6')),
                    );
                    return; // Detiene la ejecución del resto del código
                  }
                  // Acción al presionar el botón de iniciar sesión
                  GoRouter.of(context).go('/home');
                },
                child: const Text('Get me in!'),
              ),
              const SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  // Acción al presionar el texto de registro
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
