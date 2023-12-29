import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/web_service/repositories/quizz_repository.dart';

class SoloQuizzButton extends StatelessWidget {
  const SoloQuizzButton({super.key});
  final QuizzRepository quizzRepository = const QuizzRepository();

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          quizzRepository.fetchQuizzCategories().then((value) {
            if (value.isNotEmpty) {
              context.go('/home/quizz_selection', extra: value);
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
          'Jouer !',
          style: ThemeConfig.elevatedButtonTextStyle,
        ));
  }
}
