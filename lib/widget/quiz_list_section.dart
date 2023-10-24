import 'package:eduwall_super_apps/screens/quiz/quiz.dart';
import 'package:flutter/material.dart';

class QuizListSection extends StatelessWidget {
  QuizListSection({super.key});

  List<String> quizList = [
    'Quiz 1',
    'Quiz 2',
    'Quiz 3',
    'Quiz 4',
    'Quiz 5',
    'Quiz 6',
    'Quiz 7',
    'Quiz 8',
    'Quiz 9',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: quizList.length,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => GestureDetector(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Quiz(),
          ),
        ),
        child: ListTile(
          leading: Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: index == 0
                  ? Color(0xFF3871C1)
                  : Color(0xFF3871C1).withOpacity(0.6),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.quiz,
              color: Colors.white,
            ),
          ),
          title: Text(quizList[index]),
          subtitle: Text("Judul Quiz"),
        ),
      ),
    );
  }
}
