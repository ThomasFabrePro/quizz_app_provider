import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_game_model.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/widgets/quizz/quizz_category_card.dart';

class QuizzSelectionPage extends StatelessWidget {
  const QuizzSelectionPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BasePage(appBarText: 'Catégories', child: QuizzSelectionContent());
  }
}

class QuizzSelectionContent extends StatelessWidget {
  QuizzSelectionContent({super.key});
  final QuizzGame quizzGame = QuizzGame.instance;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      const Text("Choisis ton arme"),
      SizedBox(
        height: height * 0.8,
        child: ListView.builder(
          itemCount: quizzGame.quizzCategoriesList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuizzCategoryCard(
                  quizz: quizzGame.quizzCategoriesList[index]),
            );
          },
        ),
      ),
    ]);
  }
}
