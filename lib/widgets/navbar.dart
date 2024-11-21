import 'package:flutter/material.dart';

class Navbar extends StatelessWidget {
  final int currentIndex;
  const Navbar({Key? key, required this.currentIndex}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(
            icon: Icon(Icons.collections), label: 'My Collection'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      ],
      onTap: (index) {
        if (index == 0) Navigator.pushNamed(context, '/');
        if (index == 1) Navigator.pushNamed(context, '/myCollection');
        if (index == 2) Navigator.pushNamed(context, '/profile');
      },
    );
  }
}
