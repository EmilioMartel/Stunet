import 'package:flutter/material.dart';
import 'package:stunet/config/theme/app_theme.dart';
import 'package:stunet/presentation/screens/stunet/chat_screen.dart';
import 'package:stunet/presentation/screens/stunet/discover_screen.dart';
import 'package:stunet/presentation/screens/stunet/home_screen.dart';
import 'package:stunet/presentation/screens/stunet/profile_screen.dart';
import 'package:stunet/presentation/screens/stunet/search_screen.dart';
// Importa la clase AppTheme

class MainScreen extends StatefulWidget {
  static const name = 'home-screen';

  const MainScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    const DiscoverScreen(),
    const ChatScreen(),
    const ProfileScreen(),
  ];
  
  final List<String> _titles = [
    'Home',
    'Search',
    'Discover',
    'Chat',
    'Profile',
  ];

  // Estado para controlar el modo claro/oscuro
  bool _isDarkMode = true;

  // Función para cambiar entre el modo claro y oscuro
  void _toggleDarkMode() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme(
        isDarkMode: _isDarkMode,
      ).getTheme(),
      home: Scaffold(
        appBar: AppBar(
          title: Text(_titles[_currentIndex]),
          actions: [
            // IconButton para alternar el modo claro/oscuro
            IconButton(
              icon: Icon(_isDarkMode ? Icons.wb_sunny : Icons.nightlight_round),
              onPressed: _toggleDarkMode,
            ),
          ],
        ),
        body: _screens[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(AppTheme().selectedColor),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              icon: Icon(Icons.home,),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              icon: Icon(Icons.explore),
              label: 'Discover',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              icon: Icon(Icons.chat),
              label: 'Chat',
            ),
            BottomNavigationBarItem(
              backgroundColor: Colors.blueAccent,
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}
