import 'package:flutter/material.dart';

class ButtomNavigatorCustome extends StatelessWidget {
  const ButtomNavigatorCustome(
      {required this.switchScrenn, required this.currentIndex, super.key});

  final void Function(int index) switchScrenn;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      iconSize: 32,
      selectedItemColor: Color(0xFF674AEF),
      showUnselectedLabels: true,
      selectedFontSize: 18,
      unselectedItemColor: Colors.grey,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        BottomNavigationBarItem(
            icon: Icon(Icons.arrow_circle_right), label: 'Log Out'),
      ],
      onTap: (index) {
        switchScrenn(index);
      },
    );
  }
}
