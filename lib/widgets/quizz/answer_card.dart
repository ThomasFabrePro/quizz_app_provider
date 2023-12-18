import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/quizz/quizz_game_model.dart';

class AnswerCard extends StatelessWidget {
  final int index;
  final String answerText;
  const AnswerCard({super.key, required this.index, required this.answerText});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzGame>(builder: (context, quizzGame, child) {
      List<Color> optionColors = quizzGame
          .quizz.quizzQuestions[quizzGame.currentQuestionIndex]
          .getOptionColors(index);
      return GestureDetector(
        onTap: () {
          quizzGame.answerQuestion(index);
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
            child: Text(
              answerText,
              style: const TextStyle(color: Colors.white, fontSize: 20),
            ),
          ),
        ),
      );
    });
  }
}
