import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class MyCollectionScreen extends StatelessWidget {
  const MyCollectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Safira's Collection"),
      ),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              title: const Text("My Artwork 1"),
              subtitle: const Text("2024-11-18"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (context) => const Dialog(
                    child: Text("Popup for Artwork 1"),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: const Navbar(currentIndex: 1),
    );
  }
}
