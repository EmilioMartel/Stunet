import 'package:flutter/material.dart';
import 'package:stunet/presentation/screens/stunet/chat_screen.dart';
import 'package:stunet/presentation/screens/stunet/discover_screen.dart';
import 'package:stunet/presentation/screens/stunet/home_screen.dart';
import 'package:stunet/presentation/screens/stunet/profile_screen.dart';
import 'package:stunet/presentation/screens/stunet/search_screen.dart';

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
    const HomeScreen(),
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_currentIndex])),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
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
        ]

      ),
    );
  }
}
