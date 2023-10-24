import 'package:flutter/material.dart';

class NilaiQuiz extends StatelessWidget {
  const NilaiQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: false,
        title: const Text(
          "Nilai Quiz Mahasiswa",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
      body: Text("asdsa"),
    );
  }
}
