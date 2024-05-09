
enum FromWho { me, hers }


class Message {
  final String text;
  final String? imageUrl;
  final FromWho fromWhow;

  Message({
    required this.text, 
    this.imageUrl, 
    required this.fromWhow
  });
}