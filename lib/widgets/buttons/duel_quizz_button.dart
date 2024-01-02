import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_game_model.dart';
import 'package:quizz_app_provider/web_service/repositories/quizzes/duel_quizz_repository.dart';

class DuelQuizzButton extends StatelessWidget {
  const DuelQuizzButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          QuizzGame.instance.init(const DuelQuizzRepository());
        },
        child: const Text(
          'Duel',
          style: ThemeConfig.elevatedButtonTextStyle,
        ));
  }
}
