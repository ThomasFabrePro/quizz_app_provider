import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizz/quizz_category.dart';
import 'package:quizz_app_provider/screens/base_page.dart';
import 'package:quizz_app_provider/widgets/quizz/quizz_category_card.dart';

class QuizzSelectionPage extends StatelessWidget {
  const QuizzSelectionPage({super.key});
  static List<QuizzCategory> quizzCategoryList = [];
  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBarText: 'Sélection',
      child: Center(
        child: ListView.builder(
          itemCount: quizzCategoryList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: QuizzCategoryCard(name: quizzCategoryList[index].name),
            );
          },
        ),
      ),
    );
  }
}
