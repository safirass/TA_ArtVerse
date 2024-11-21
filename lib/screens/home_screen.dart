import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/artwork_card.dart';
import '../services/api_service.dart';
import '../screens/detail_screen.dart'; // Pastikan untuk mengimpor DetailScreen

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> artworks = [];
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    fetchArtworks();
  }

  Future<void> fetchArtworks() async {
    final fetchedArtworks = await ApiService.fetchArtworks();
    setState(() {
      artworks = fetchedArtworks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ArtVerse'),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () => Navigator.pushNamed(context, '/favorite'),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: const InputDecoration(
                hintText: 'Search artworks...',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 4,
              ),
              itemCount: artworks.length,
              itemBuilder: (context, index) {
                final artwork = artworks[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke DetailScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailScreen(artwork: artwork),
                      ),
                    );
                  },
                  child: ArtworkCard(artwork: artwork),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(currentIndex: 0),
    );
  }
}