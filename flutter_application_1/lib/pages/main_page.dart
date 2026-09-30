import 'package:flutter/material.dart';

import 'home_page.dart';
import 'profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  /// Index tab yang sedang aktif (0 = Home, 1 = Profile).
  int _currentIndex = 0;

  /// Daftar halaman sesuai urutan tab.
  final List<Widget> _pages = const [HomePage(), MyProfile()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Hanya halaman aktif yang tampil, tapi semua state tetap hidup.
      body: IndexedStack(index: _currentIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentIndex,
        onDestinationSelected: (index) {
          setState(() => _currentIndex = index);
        },
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.pets_outlined),
            selectedIcon: Icon(Icons.pets),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.person_outline),
            selectedIcon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
