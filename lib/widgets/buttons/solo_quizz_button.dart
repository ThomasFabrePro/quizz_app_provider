import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_game_model.dart';
import 'package:quizz_app_provider/web_service/repositories/quizzes/solo_quizz_repository.dart';

class SoloQuizzButton extends StatelessWidget {
  const SoloQuizzButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          final QuizzGame quizzGame = QuizzGame.instance;
          quizzGame.init(const SoloQuizzRepository());
          quizzGame.fetchQuizzCategories().then((_) {
            if (quizzGame.quizzCategoriesList.isNotEmpty) {
              context.go('/home/solo_mode_quizz_selection');
            } else {
              ScaffoldMessenger.of(context)
                ..hideCurrentSnackBar()
                ..showSnackBar(const SnackBar(
                    backgroundColor: Colors.red,
                    content: Text('Aucun quizz disponible')));
            }
          });
        },
        child: const Text(
          'Mode solo',
          style: ThemeConfig.elevatedButtonTextStyle,
        ));
  }
}
