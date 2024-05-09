import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  static const name = 'profile-screen';

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(
                  'https://pics.filmaffinity.com/261079333126887-nm_200.jpg'),
            ),
            const SizedBox(height: 20),
            const Text(
              '@NicolasCage',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildFollowInfo('Followers', 1000),
                const SizedBox(width: 20),
                _buildFollowInfo('Follows', 500),
              ],
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Short Description about me...',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Events',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: _buildEventColumn(
                      title: 'My Events',
                      events: [
                        _Event(
                            title: 'Event 1',
                            image: 'https://via.placeholder.com/150',
                            price: 10.0),
                       _Event(
                            title: 'Event 2',
                            image: 'https://via.placeholder.com/150',
                            price: 20.0),
                        _Event(
                            title: 'Event 3',
                            image: 'https://via.placeholder.com/150',
                            price: 0.0),
                      ],
                    ),
                  ),
                  Expanded(
                    child: _buildEventColumn(
                      title: 'Saved Events',
                      events: [
                        _Event(
                            title: 'Event 4',
                            image: 'https://via.placeholder.com/150',
                            price: 15.0),
                        _Event(
                            title: 'Event 5',
                            image: 'https://via.placeholder.com/150',
                            price: 30.0),
                       _Event(
                            title: 'Event 6',
                            image: 'https://via.placeholder.com/150',
                            price: 0.0),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFollowInfo(String label, int count) {
    return Column(
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          count.toString(),
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }

  Widget _buildEventColumn(
      {required String title, required List<_Event> events}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          // Añade este widget Center para centrar el título
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return _buildEventCard(event);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildEventCard(_Event event) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              event.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                event.image,
                width: double.infinity,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              event.price == 0 ? 'Free' : '\$${event.price}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Event {
  final String title;
  final String image;
  final double price;

  _Event({required this.title, required this.image, required this.price});
}
