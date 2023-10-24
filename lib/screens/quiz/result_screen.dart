import 'package:eduwall_super_apps/data/nilai.dart';
import 'package:eduwall_super_apps/data/questions.dart';
import 'package:eduwall_super_apps/screens/quiz/question_summary.dart/questions_summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {required this.choosenAnswer, required this.onRestart, super.key});

  final List<String> choosenAnswer;
  final void Function() onRestart;

  // manual
  // List<Map<String, Object>> getSummaryData() {
  //   final List<Map<String, Object>> summary = [];

  //   for (var i = 0; i < choosenAnswer.length; i++) {
  //     summary.add({
  //       'question_index': i,
  //       'question': questions[i].text,
  //       'correct_answer': questions[i].answers[0],
  //       'user_answer': choosenAnswer[i],
  //     });
  //   }
  //   return summary;
  // }

  // use method get
  List<Map<String, Object>> get summaryData {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < choosenAnswer.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'user_answer': choosenAnswer[i],
      });
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    // final summaryData = getSummaryData();
    final numTotalQuestion = questions.length;
    // arrow function
    final numCorrectQuestion = summaryData
        .where((data) => data['user_answer'] == data['correct_answer'])
        .length;

    // nilai['pertemuan'] = 1;
    // nilai['nilai'] = summaryData
    //         .where((data) => data['user_answer'] == data['correct_answer'])
    //         .length *
    //     10;

    print(nilai);

    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "You answered $numCorrectQuestion out of $numTotalQuestion questions correctly!",
              style: GoogleFonts.lato(
                  color: Color.fromARGB(255, 235, 153, 250),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(height: 20),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon: const Icon(Icons.refresh),
              label: const Text('Kembali'),
            )
          ],
        ),
      ),
    );
  }
}
