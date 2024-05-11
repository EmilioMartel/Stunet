import 'package:flutter/material.dart';
import 'package:stunet/domain/entities/friend_post.dart';
import 'package:stunet/domain/entities/home_event.dart';



class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  final List<HomeEvent> events = [
    HomeEvent(
      title: 'Concierto en vivo',
      description: 'Ven y disfruta de música en vivo esta noche',
      date: DateTime.now().add(const Duration(days: 1)),
    ),
    HomeEvent(
      title: 'Exposición de arte',
      description: 'Descubre nuevas obras de arte en nuestra galería',
      date: DateTime.now().add(const Duration(days: 2)),
    ),
  ];

  final List<FriendPost> friendPosts = [
    FriendPost(
      title: 'Nuevo proyecto',
      message: 'Empezando un nuevo proyecto de desarrollo de aplicaciones',
      date: DateTime.now().subtract(const Duration(days: 2)),
      user: 'Juan',
    ),
    FriendPost(
      title: 'Vacaciones en la playa',
      message: '¡Disfrutando de unas maravillosas vacaciones en la playa!',
      date: DateTime.now().subtract(const Duration(days: 5)),
      user: 'María',
    ),
    
  ];

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildSectionTitle('Eventos'),
          _buildEventList(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Publicaciones de Amigos'),
          _buildFriendPostList(),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildEventList() {
    return Column(
      children: events.map((event) {
        return Column(
          children: [
            ListTile(
              title: Text(
                event.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 8.0),
                  Text(
                    event.description,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    'Fecha: ${event.date.day}/${event.date.month}/${event.date.year}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              tileColor: Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(
                vertical: 12.0,
                horizontal: 16.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
            ),
            const SizedBox(height: 16.0), // Espacio vertical entre eventos
          ],
        );
      }).toList(),
    );
  }

  Widget _buildFriendPostList() {
    return Column(
      children: friendPosts.map((post) {
        return Card(
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 2.0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  post.message,
                  style: const TextStyle(
                    fontSize: 16.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Publicado por ${post.user}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      'Fecha: ${post.date.day}/${post.date.month}/${post.date.year}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }
}
