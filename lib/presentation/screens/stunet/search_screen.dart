

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:stunet/domain/entities/event.dart';
import 'package:stunet/presentation/screens/stunet/event_detail_screen.dart';



class SearchScreen extends StatelessWidget {

  static const name = 'search-screen';

  final List<Event> events = [
    Event(title: "Cinama of Friendship", imageUrl: "https://cd1.taquilla.com/data/images/t/c6/cine-yelmo-vigo.jpg", isFree: true, category: "Cinema"),
    Event(title: "Party with Jesus", imageUrl: "https://elolivar.es/olivar-content/uploads/2023/09/como-organizar-una-fiesta.jpg", isFree: false, category: "Party"),
    // Agrega más eventos aquí
  ];

   SearchScreen({super.key});

  List<Event> generateRandomEvents(int count) {
    final List<Event> randomEvents = [];
    final Random random = Random();

    for (int i = 0; i < count; i++) {
      final Event event = events[random.nextInt(events.length)];
      randomEvents.add(event);
    }

    return randomEvents;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Events',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 15, // Cantidad de eventos a mostrar
                itemBuilder: (context, index) {
                  final event = generateRandomEvents(1)[0];
                  return _buildEventCard(context, event);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEventCard(BuildContext context,  event) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.network(event.imageUrl),
        title: Text(event.title),
        subtitle: Text(event.isFree ? 'Free' : 'Pay'),
        trailing: Text(event.category),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => EventDetailScreen(event: event),
            ),
          );
        },
      ),
    );
  }
}
