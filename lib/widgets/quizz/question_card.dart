import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizz/quizz_game_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzGame>(builder: (context, quizzGame, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${quizzGame.currentQuestionIndex + 1} / ${quizzGame.quizz.quizzQuestions.length}",
                style: const TextStyle(color: ThemeConfig.primaryColor),
              ),
              Text(quizzGame.quizz
                  .quizzQuestions[quizzGame.currentQuestionIndex].question),
            ],
          ),
        ),
      );
    });
  }
}
