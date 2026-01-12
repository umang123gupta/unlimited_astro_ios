import 'package:flutter/material.dart';
import '../home/ui/home_page.dart';
import '../settings/ui/settings_page.dart';
import 'app_footer.dart';

class MainLayout extends StatefulWidget {
  const MainLayout({super.key});

  @override
  State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    HomePage(),
    Center(child: Text("Spirituals")),
    Center(child: Text("Read")),
    SettingsPage(),
  ];

  void _onTabChange(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: AppFooter(
        currentIndex: _currentIndex,
        onTap: _onTabChange,
      ),
    );
  }
}
