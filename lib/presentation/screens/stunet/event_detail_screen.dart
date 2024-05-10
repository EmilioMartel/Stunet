import 'package:flutter/material.dart';
import 'package:stunet/domain/entities/event.dart';

class EventDetailScreen extends StatelessWidget {
  final Event event;

  const EventDetailScreen({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(event.imageUrl),
            const SizedBox(height: 16),
            Text(
              'Title: ${event.title}',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('Category: ${event.category}'),
            Text('Price: ${event.isFree ? 'Gratis' : 'Pago'}'),
          ],
        ),
      ),
    );
  }
}
