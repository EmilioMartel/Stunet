import 'package:flutter/material.dart';


class SignInScreen extends StatelessWidget {

  static const String name = 'signin-screen';

  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In"),
      ),
      body: const Center(child: Text('Sign In Screen'))
    );
  }
}