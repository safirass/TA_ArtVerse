import 'package:artverse/screens/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/my_collection_screen.dart';
import 'screens/profile_screen.dart';

void main() {
  runApp(const ArtVerseApp());
}

class ArtVerseApp extends StatelessWidget {
  const ArtVerseApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ArtVerse',
      theme: ThemeData(
        fontFamily: 'MaisonDeArtisan',
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomeScreen(),
        '/favorite': (context) => const FavoriteScreen(),
        '/myCollection': (context) => const MyCollectionScreen(),
        '/profile': (context) => const ProfileScreen(),
      },
    );
  }
}
