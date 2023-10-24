import 'package:eduwall_super_apps/data/questions.dart';
import 'package:eduwall_super_apps/screens/course_content.dart';
import 'package:eduwall_super_apps/screens/course_list.dart';
import 'package:eduwall_super_apps/screens/home_screen.dart';
import 'package:eduwall_super_apps/screens/mata_kuliah.dart';
import 'package:eduwall_super_apps/screens/quiz/question_screen.dart';
import 'package:eduwall_super_apps/screens/quiz/result_screen.dart';
import 'package:eduwall_super_apps/screens/quiz/start_screen.dart';
import 'package:flutter/material.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  // method 1 for lift up a state,that means you can use a function in another class
  // or that means you can make a function as a paramater that can be use in another class
  // Widget? _activeScreen;

  // @override
  // void initState() {
  //   _activeScreen = StartScreen(switchScreen);
  //   super.initState();
  // }

  //method 2

  List<String> _selectedAnswer = [];
  var _activeScreen = 'start-screen';
  void switchScreen() {
    setState(() {
      _activeScreen = 'questions-screen';
    });
  }

  void chooseAnswer(String answer) {
    _selectedAnswer.add(answer);
    if (_selectedAnswer.length == questions.length) {
      setState(() {
        _activeScreen = 'results-screen';
      });
    }
  }

  void restartQuiz() {
    setState(() {
      _selectedAnswer = [];
      // _activeScreen = 'start-screen';
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseContent(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    // alternative of using condtional,use ternary operation
    // final screenWidget = _activeScreen == 'start-screen'
    //     ? StartScreen(switchScreen)
    //     : const QuestionsScreen();

    // use if else
    Widget screenWidget = StartScreen(switchScreen);

    if (_activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(
        onSelectAnswer: chooseAnswer,
      );
    }

    if (_activeScreen == 'results-screen') {
      screenWidget = ResultsScreen(
        choosenAnswer: _selectedAnswer,
        onRestart: restartQuiz,
      );
    }

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 18, 52, 243),
              Color.fromARGB(255, 4, 7, 210),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "images/ideas.png",
                width: 150,
              ),
              SizedBox(height: 10),
              screenWidget,
            ],
          ),
        ),
      ),
    );
  }
}
