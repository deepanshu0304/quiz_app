import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/question_indentifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemdata, {super.key});
  final Map<String, Object> itemdata;

  @override
  Widget build(BuildContext context) {
    final bool isCorrectAns =
        itemdata['correct_answer'] == itemdata['user_answer'];
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        QuestionIndentifier(
          itemdata['question_index'] as int,
          isCorrectAns,
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                itemdata['question'] as String,
                style: GoogleFonts.lato(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                itemdata['user_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 202, 171, 252),
                ),
              ),
              Text(
                itemdata['correct_answer'] as String,
                style: const TextStyle(
                  color: Color.fromARGB(255, 181, 254, 246),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
