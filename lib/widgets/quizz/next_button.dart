import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizz/quizz_game_model.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzGame>(builder: (context, quizzGame, child) {
      return Visibility(
        visible: quizzGame
            .quizz.quizzQuestions[quizzGame.currentQuestionIndex].isAnswered,
        child: ElevatedButton(
          onPressed: () {
            quizzGame.nextQuestion();
          },
          child: const Text(
            "NEXT",
            style: ThemeConfig.elevatedButtonTextStyle,
          ),
        ),
      );
    });
  }
}
