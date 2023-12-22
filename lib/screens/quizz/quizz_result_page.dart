import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';

class QuizzResultPage extends StatelessWidget {
  final Quizz quizz;
  const QuizzResultPage({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        appBarText: 'Résultats', child: QuizzResultContent(quizz: quizz));
  }
}

class QuizzResultContent extends StatelessWidget {
  final Quizz quizz;
  const QuizzResultContent({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text("Score : ${quizz.score}"),
        ElevatedButton(
          onPressed: () {
            context.go('/home');
          },
          child: const Text(
            "MENU",
            style: ThemeConfig.elevatedButtonTextStyle,
          ),
        ),
      ],
    );
  }
}
