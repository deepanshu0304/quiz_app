import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/result_screen.dart';
import 'package:quiz_app/start_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAns = [];
  var activeScreen = 'start-screen';
    
  void switchScreen() {
    setState(() {
      activeScreen = 'questions-screen';
    });
  }
  void chooseAns(String ans) {
    selectedAns.add(ans);
    if (selectedAns.length == questions.length) {
      setState(() {
        // selectedAns = [];
        activeScreen = 'result-screen';
      });
    }
  }

  void onRestart() {
    setState(() {
      selectedAns = [];
      activeScreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    
    Widget screenWidget = StartScreen(switchScreen);
    if (activeScreen == 'questions-screen') {
      screenWidget = QuestionsScreen(chooseAns);
    } else if (activeScreen == 'result-screen') {
      screenWidget =
          ResultScreen(chosenAnswer: selectedAns, onRestart: onRestart);
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 13, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
