import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizz/quizz_model.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Quizz>(builder: (context, quizz, child) {
      return Visibility(
        visible: quizz.actualQuestionIsAnswered,
        child: ElevatedButton(
          onPressed: () {
            quizz.nextQuestion().then((_) {
              if (quizz.isFinished) {
                context.go('/result', extra: quizz);
              }
            });
          },
          child: const Text(
            "NEXT",
            style: ThemeConfig.elevatedButtonTextStyle,
          ),
        ),
      );
    });
  }
}
