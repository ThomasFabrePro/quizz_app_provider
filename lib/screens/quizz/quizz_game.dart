import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/quizz/quizz_category_model.dart';
import 'package:quizz_app_provider/models/quizz/quizz_game_model.dart';
import 'package:quizz_app_provider/screens/base_page.dart';
import 'package:quizz_app_provider/widgets/quizz/answers_grid.dart';
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
      create: (context) => QuizzGame(quizz: quizz),
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          //TimingBar(),
          QuestionCard(),
          AnswersGrid(),
          NextButton(),
          // SizedBox(/*here for front end purpose*/)
        ],
      ),
    );
  }
}
