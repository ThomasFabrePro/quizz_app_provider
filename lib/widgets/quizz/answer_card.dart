import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';

class AnswerCard extends StatelessWidget {
  final int index;
  final String answerText;
  const AnswerCard({super.key, required this.index, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Consumer<Quizz>(builder: (context, quizz, child) {
      List<Color> optionColors = quizz.question.getOptionColors(index);
      return GestureDetector(
        onTap: () {
          quizz.answerQuestion(index);
        },
        child: Container(
          margin: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: optionColors),
            border: Border.all(
              color: Colors.white30,
              width: 1,
            ),
          ),
          child: Center(
            child: AutoSizeText(
              answerText,
              textAlign: TextAlign.center,
              maxFontSize: 20,
              maxLines: 3,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ),
      );
    });
  }
}
