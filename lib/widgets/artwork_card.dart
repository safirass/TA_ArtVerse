import 'package:flutter/material.dart';
import '../models/artwork_model.dart'; // Pastikan Anda mengimpor model Artwork

class ArtworkCard extends StatelessWidget {
  final Artwork artwork; // Ganti dynamic dengan Artwork
  const ArtworkCard({Key? key, required this.artwork}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Expanded(
            child: Image.network(
              artwork.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0), // Tambahkan padding untuk estetika
            child: Text(
              artwork.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}