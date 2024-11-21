import 'package:flutter/material.dart';
import '../screens/home_screen.dart';
import '../models/artwork_model.dart'; // Pastikan Anda mengimpor model Artwork

class DetailScreen extends StatelessWidget {
  final Artwork artwork; // Ganti dynamic dengan Artwork
  const DetailScreen({Key? key, required this.artwork}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.network(
              artwork.imageUrl,
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.3),
              colorBlendMode: BlendMode.darken,
            ),
          ),
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      color: Colors.white,
                      onPressed: () => Navigator.pop(context),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      color: Colors.white,
                      onPressed: () {
                        // Handle adding or removing from favorites
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Added to favorites')),
                        );
                      },
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                        // Zoom functionality or fullscreen image
                      },
                      child: Image.network(
                        artwork.imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10.0),
                  padding: const EdgeInsets.all(16.0),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        artwork.title,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Artist: ${artwork.artistTitle}'),
                      Text('Date: ${artwork.dateDisplay}'),
                      const SizedBox(height: 8.0),
                      Text(artwork.description ?? 'No description available.'),
                      const SizedBox(height: 8.0),
                      const Text('Details:'),
                      Text('Place: ${artwork.placeOfOrigin}'),
                      Text('Medium: ${artwork.mediumDisplay}'),
                      Text('Dimensions: ${artwork.dimensions}'),
                      Text('Credit Line: ${artwork.creditLine}'),
                      Text('Reference Number: ${artwork.id}'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}