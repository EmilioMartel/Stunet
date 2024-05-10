import 'package:flutter/material.dart';

class DiscoverScreen extends StatefulWidget {
  static const name = 'discover-screen';

  const DiscoverScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DiscoverScreenState createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen> {
  final List<Profile> profiles = [
    Profile(name: 'John', age: 25, imageUrl: 'https://pics.filmaffinity.com/261079333126887-nm_200.jpg'),
    Profile(name: 'Josefa', age: 27, imageUrl: 'https://s1.elespanol.com/2023/08/08/cultura/series/785181485_235220578_1706x960.jpg'),
    Profile(name: 'Pedro Sanchez', age: 30, imageUrl: 'https://upload.wikimedia.org/wikipedia/commons/f/f0/Pedro_Sánchez_in_2023.jpg'),
    // Agrega más perfiles aquí
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: profiles.isEmpty
          ? const Center(
              child: Text(
                '¡No hay más personas cerca de ti para conocer!',
                style: TextStyle(fontSize: 20, 
                fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            )
          : Stack(
              children: List.generate(
                profiles.length,
                (index) {
                  if (index != _currentIndex) {
                    return const SizedBox(); // Oculta las tarjetas que no están en el índice actual
                  }

                  final profile = profiles[index];

                  return GestureDetector(
                    onPanUpdate: (details) {
                      // Detecta el desplazamiento horizontal y actualiza el índice actual
                      if (details.delta.dx > 0) {
                        setState(() {
                          if (_currentIndex > 0) {
                            _currentIndex--;
                          }
                        });
                      } else if (details.delta.dx < 0) {
                        setState(() {
                          if (_currentIndex < profiles.length - 1) {
                            _currentIndex++;
                          }
                        });
                      }
                    },
                    child: Dismissible(
                      key: Key(profile.name), // Usamos el nombre del perfil como clave para identificarlo
                      direction: DismissDirection.horizontal, // Solo permitimos desplazamiento horizontal
                      onDismissed: (direction) {
                        // Elimina el perfil del listado cuando se desliza hacia la izquierda o derecha
                        setState(() {
                          profiles.removeAt(_currentIndex);
                          if (_currentIndex > 0) {
                            _currentIndex--;
                          }
                        });
                      },
                      background: Container(
                        color: Colors.blue, // Color de fondo al deslizar
                        alignment: Alignment.centerLeft,
                        child: const Icon(Icons.favorite, color: Colors.white, size: 50),
                      ),
                      secondaryBackground: Container(
                        color: Colors.red, // Color de fondo al deslizar
                        alignment: Alignment.centerRight,
                        child: const Icon(Icons.close, color: Colors.white, size: 50),
                      ),
                      child: ProfileCard(profile: profile),
                    ),
                  );
                },
              ),
            ),
    );
  }
}

class Profile {
  final String name;
  final int age;
  final String imageUrl;

  Profile({required this.name, required this.age, required this.imageUrl});
}

class ProfileCard extends StatelessWidget {
  final Profile profile;

  const ProfileCard({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                child: Image.network(
                  profile.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    profile.name,
                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    '${profile.age} years old',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
