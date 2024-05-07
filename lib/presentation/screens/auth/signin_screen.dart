import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SignInScreen extends StatelessWidget {

  static const String name = 'signin-screen';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController surnameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Sign In')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            TextField(
              controller: surnameController,
              decoration: const InputDecoration(labelText: 'Surname'),
            ),
            TextField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
            ),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String name = nameController.text;
                String surname = surnameController.text;
                String email = emailController.text;
                String password = passwordController.text;

                if (name.isEmpty || surname.isEmpty || email.isEmpty || password.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('All fields are mandatory')),
                  );
                  return;
                }

                if (!email.contains("@alu.ulpgc.es")) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Email must be from @alu.ulpgc.es')),
                  );
                  return;
                }

                if (password.length < 6) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Password must be at least 6 characters long')),
                  );
                  return;
                }

                // Proceed with sign in
                GoRouter.of(context).go('/home');
              },
              child: const Text('Sign In'),
              
            ),
            GestureDetector(
                onTap: () {
                  // Acción al presionar el texto de registro
                  GoRouter.of(context).go('/');
                },
                child: const Text(
                  'Do you have an account?, Log in here!',
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
    );
  }
}
