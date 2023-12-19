import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/quizz/quizz_model.dart';
import 'package:quizz_app_provider/screens/base_page.dart';
import 'package:quizz_app_provider/widgets/quizz/answers_grid.dart';
import 'package:quizz_app_provider/widgets/quizz/linear_timer.dart';
import 'package:quizz_app_provider/widgets/quizz/next_button.dart';
import 'package:quizz_app_provider/widgets/quizz/question_card.dart';

class QuizzGamePage extends StatelessWidget {
  final Quizz quizz;
  const QuizzGamePage({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        appBarText: quizz.name.toUpperCase(),
        child: QuizzGameContent(
          quizz: quizz,
        ));
  }
}

class QuizzGameContent extends StatelessWidget {
  final Quizz quizz;
  const QuizzGameContent({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => quizz,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            LinearTimer(onTimerFinish: () {
              quizz.answerQuestion(-1);
            }),
            const SizedBox(height: 32),
            const QuestionCard(),
            const SizedBox(height: 32),
            const AnswersGrid(),
            const SizedBox(height: 16),
            const NextButton(),
            // SizedBox(/*here for front end purpose*/)
          ],
        ),
      ),
    );
  }
}
