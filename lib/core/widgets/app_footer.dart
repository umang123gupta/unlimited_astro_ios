import 'package:flutter/material.dart';

class AppFooter extends StatelessWidget {
  final int currentIndex;

  const AppFooter({super.key, required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      selectedItemColor: Colors.orange,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Spirituals'),
        BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Read'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Settings'),
      ],
    );
  }
}
