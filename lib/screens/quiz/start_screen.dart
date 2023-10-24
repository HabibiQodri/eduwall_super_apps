import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // make iamge slightly transparent

          // first method,not recomended but must to know
          // Opacity(
          //   opacity: 0.5,
          //   child: Image.asset(
          //     'assets/images/quiz-logo.png',
          //     width: 300,
          //   ),
          // ),

          // second method,recomended
          Image.asset(
            'images/balloon2.png',
            width: 300,
            // color: Color.fromARGB(255, 246, 246, 11),
          ),
          const SizedBox(height: 50),
          Text(
            'Ayo Lihat Sampai Mana Pemahamanmu',
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          const SizedBox(height: 30),
          OutlinedButton.icon(
            onPressed: startQuiz,
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              "Kerjakan Quiz",
              style: GoogleFonts.lato(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            // child: const Text("Start Quiz"),
          ),
        ],
      ),
    );
  }
}
