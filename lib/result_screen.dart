import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_summary.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen(
      {super.key, required this.chosenAnswer, required this.onRestart});

  final List<String> chosenAnswer;
  final void Function() onRestart;
  List<Map<String, Object>> getResultSummary() {
    final List<Map<String, Object>> summary = [];

    for (var i = 0; i < chosenAnswer.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswer[i],
        },
      );
    }

    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getResultSummary();
    final totalQue = questions.length;
    final correctQue = summaryData.where((element) {
      return element['correct_answer'] == element['user_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'You answered $correctQue out of $totalQue question correctly!',
                textAlign: TextAlign.center,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 20,
                )),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            const SizedBox(
              height: 30,
            ),
            TextButton.icon(
              onPressed: onRestart,
              style: TextButton.styleFrom(foregroundColor: Colors.white),
              icon: const Icon(Icons.refresh),
              label: const Text("Restart quiz,"),
            ),
          ],
        ),
      ),
    );
  }
}
