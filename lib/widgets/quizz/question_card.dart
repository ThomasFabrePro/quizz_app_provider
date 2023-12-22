import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/widgets/quizz/answer_tracker.dart';

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
              Row(
                children: [
                  Text(
                    "${quizz.currentQuestionIndex + 1} / ${quizz.quizzQuestions.length}",
                    style: const TextStyle(color: ThemeConfig.primaryColor),
                  ),
                  const SizedBox(width: 24),
                  AnswerTracker(isProperlyAnswered: quizz.answersTracker[0]),
                  const SizedBox(width: 8),
                  AnswerTracker(isProperlyAnswered: quizz.answersTracker[1]),
                  const SizedBox(width: 8),
                  AnswerTracker(isProperlyAnswered: quizz.answersTracker[2]),
                  const SizedBox(width: 8),
                  AnswerTracker(isProperlyAnswered: quizz.answersTracker[3]),
                ],
              ),
              const SizedBox(height: 16),
              Text(quizz.actualQuestionText),
            ],
          ),
        ),
      );
    });
  }
}
