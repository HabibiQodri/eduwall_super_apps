import 'package:eduwall_super_apps/screens/bottom_naivgator.dart';
import 'package:flutter/material.dart';
import 'mata_kuliah.dart';
import 'profile_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    MataKuliah(),
    ProfileScreen(),
    // Tambahkan layar lain di sini sesuai kebutuhan.
  ];

  void switchMenu(index) {
    setState(() {
      _currentIndex = index;
      // print(_currentIndex);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      // bottomNavigationBar: BottomNavigationBar(
      //   currentIndex: _currentIndex,
      //   iconSize: 32,
      //   selectedItemColor: Color(0xFF674AEF),
      //   showUnselectedLabels: true,
      //   selectedFontSize: 18,
      //   unselectedItemColor: Colors.grey,
      //   items: const [
      //     BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
      //     BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
      //     BottomNavigationBarItem(
      //         icon: Icon(Icons.arrow_circle_right), label: 'Log Out'),
      //   ],
      //   onTap: (index) {
      //     setState(() {
      //       _currentIndex = index;
      //     });
      //   },
      // ),
      bottomNavigationBar: ButtomNavigatorCustome(
          currentIndex: _currentIndex, switchScrenn: switchMenu),
    );
  }
}
