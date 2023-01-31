import 'package:flutter/material.dart';
import 'package:flutter_dev/question_list.dart';
import 'package:flutter_dev/quiz_screen.dart';
import 'package:flutter_dev/result_screen.dart';


void main() {
  runApp(
      const MaterialApp(home: MyApp(),)
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int questionIndex = 0;
  int totalScore = 0;

  void answerPressed(int score){
    setState(() {
      questionIndex++;
    });
    totalScore += score;
    print(totalScore);
  }

  void resetQuiz() {
    setState(() {
      questionIndex = 0;
    });
    totalScore = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('퀴즈내기~'),
      ),
      body: (questionIndex < questionList.length)
      ? QuizScreen(
        answerPressed: answerPressed,
        questionIndex: questionIndex,
        )
      : ResultScreen(
        totalScore: totalScore,
        resetQuiz: resetQuiz,
      )
    );
  }
}
