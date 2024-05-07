import 'package:flutter/material.dart';
import 'package:stunet/presentation/widgets/shared/custom_appbar.dart';


class LoginScreen extends StatelessWidget {

  static const String name = 'login-screen';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(title: 'Login',)
        ),
      body:  Center(
        child: Text('Login Screen'),
      )
    
    );
  }
}