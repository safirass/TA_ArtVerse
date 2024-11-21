import 'package:flutter/material.dart';
import '../widgets/artwork_card.dart';
import '../widgets/navbar.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<dynamic> favoriteArtworks = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Favorites'),
      ),
      body: favoriteArtworks.isEmpty
          ? const Center(child: Text('No favorite artworks yet.'))
          : GridView.builder(
              padding: const EdgeInsets.all(8.0),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
              ),
              itemCount: favoriteArtworks.length,
              itemBuilder: (context, index) {
                return ArtworkCard(artwork: favoriteArtworks[index]);
              },
            ),
      bottomNavigationBar: const Navbar(currentIndex: 0),
    );
  }
}
