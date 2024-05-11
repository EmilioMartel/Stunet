import 'package:flutter/material.dart';
import 'package:stunet/domain/entities/friend_post.dart';
import 'package:stunet/domain/entities/home_event.dart';



class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  final List<HomeEvent> events = [
    HomeEvent(
      title: 'Life Concert',
      description: 'Come and enjoy the live music this incredible night',
      date: DateTime.now().add(const Duration(days: 1)),
    ),
    HomeEvent(
      title: 'Art exposition',
      description: 'Discover new art pieces in our gallery. It will be sensorial experience',
      date: DateTime.now().add(const Duration(days: 2)),
    ),
  ];

  final List<FriendPost> friendPosts = [
    FriendPost(
      title: 'New project',
      message: 'Starting a new IDGS subject project. Im exciting!',
      date: DateTime.now().subtract(const Duration(days: 2)),
      user: 'Juan',
    ),
    FriendPost(
      title: 'Beach Holidays',
      message: 'Enjoying a wonderfull vacation at the beach!',
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
          _buildSectionTitle('Events'),
          _buildEventList(),
          const SizedBox(height: 20.0),
          _buildSectionTitle('Friends posts'),
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
                event.title,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 8.0),
              Text(
                event.description,
                style: const TextStyle(
                  fontSize: 16.0,
                ),
              ),
              const SizedBox(height: 8.0),

              Text(
                    'Date: ${event.date.day}/${event.date.month}/${event.date.year}',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey[600],
                    ),
                    textAlign: TextAlign.end,
                  ),
            ],
          ),
        ),
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
                      'Date: ${post.date.day}/${post.date.month}/${post.date.year}',
                      style: TextStyle(
                        fontSize: 14.0,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      '@${post.user}',
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
