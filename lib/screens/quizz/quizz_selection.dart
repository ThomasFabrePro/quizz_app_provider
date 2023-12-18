import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizz/quizz_category_model.dart';
import 'package:quizz_app_provider/screens/base_page.dart';
import 'package:quizz_app_provider/widgets/quizz/quizz_category_card.dart';

class QuizzSelectionPage extends StatelessWidget {
  final List<Quizz> quizzList;
  const QuizzSelectionPage({super.key, required this.quizzList});

  @override
  Widget build(BuildContext context) {
    return BasePage(
        appBarText: 'Catégories',
        child: QuizzSelectionContent(quizzList: quizzList));
  }
}

class QuizzSelectionContent extends StatelessWidget {
  final List<Quizz> quizzList;
  const QuizzSelectionContent({super.key, required this.quizzList});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      const Text("Choisis ton arme"),
      SizedBox(
        height: height * 0.8,
        child: ListView.builder(
          itemCount: quizzList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuizzCategoryCard(quizzCategory: quizzList[index]),
            );
          },
        ),
      ),
    ]);
  }
}
