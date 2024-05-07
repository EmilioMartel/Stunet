import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget {

  static const name = 'home-screen';

  const HomeScreen({super.key});
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home')
      ),
      body: const Center(child: Text('5 clicks!')),
      floatingActionButton: FloatingActionButton(
      onPressed: (){},
      child: const Icon(Icons.add),
      ),
    );
  }
}