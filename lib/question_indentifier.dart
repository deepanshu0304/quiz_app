import 'package:flutter/material.dart';

class QuestionIndentifier extends StatelessWidget {
  const QuestionIndentifier(this.queIndex, this.isCorrectAns, {super.key});
  final int queIndex;
  final bool isCorrectAns;

  @override
  Widget build(BuildContext context) {
    final queNumber = queIndex + 1;
    return Container(
      width: 30,
      height: 30,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: isCorrectAns
            ? const Color.fromARGB(255, 150, 198, 241)
            : const Color.fromARGB(255, 249, 133, 241),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Text(
        queNumber.toString(),
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 22, 2, 56),
        ),
      ),
    );
  }
}
