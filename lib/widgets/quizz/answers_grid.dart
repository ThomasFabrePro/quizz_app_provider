import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/quizz/quizz_model.dart';
import 'package:quizz_app_provider/widgets/quizz/answer_card.dart';

class AnswersGrid extends StatelessWidget {
  const AnswersGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Quizz>(builder: (context, quizz, child) {
      List<String> options = quizz.options;
      return GridView.builder(
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 1.75),
        itemBuilder: (context, index) {
          return AnswerCard(index: index, answerText: options[index]);
        },
      );
    });
  }
}
