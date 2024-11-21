import 'package:flutter/material.dart';
import '../widgets/navbar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      body: Center(
        child: Column(
          children: const [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage('https://github.com/safirass/profile/blob/main/selfie%202.png'),
            ),
            SizedBox(height: 8),
            Text('Safira Septiandika Salsabila'),
            Text('21120122140147'),
          ],
        ),
      ),
      bottomNavigationBar: const Navbar(currentIndex: 2),
    );
  }
}
