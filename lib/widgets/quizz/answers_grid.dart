import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/quizz/quizz_game_model.dart';
import 'package:quizz_app_provider/widgets/quizz/answer_card.dart';

class AnswersGrid extends StatelessWidget {
  const AnswersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<QuizzGame>(builder: (context, quizzGame, child) {
      List<String> options = quizzGame
          .quizz.quizzQuestions[quizzGame.currentQuestionIndex].options;
      return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 2),
        itemBuilder: (context, index) {
          return AnswerCard(index: index, answerText: options[index]);
        },
      );
    });
  }
}
