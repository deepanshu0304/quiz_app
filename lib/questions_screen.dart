import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAns, {super.key});

  final void Function(String ans) onSelectAns;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currQueInd = 0;
  void answerQue(String answer) {
    widget.onSelectAns(answer);
    setState(() {
      currQueInd++;
    });
  }

  @override
  Widget build(context) {
    final currentQue = questions[currQueInd];
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQue.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 201, 153, 251),
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            ...currentQue.getShuffledList().map(
              (item) {
                return AnswerButton(
                  item,
                  () {
                    answerQue(item);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
