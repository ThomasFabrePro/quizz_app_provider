import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizz/quizz_model.dart';

class QuestionCard extends StatelessWidget {
  const QuestionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Quizz>(builder: (context, quizz, child) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "${quizz.currentQuestionIndex + 1} / ${quizz.quizzQuestions.length}",
                style: const TextStyle(color: ThemeConfig.primaryColor),
              ),
              Text(quizz.actualQuestionText),
            ],
          ),
        ),
      );
    });
  }
}