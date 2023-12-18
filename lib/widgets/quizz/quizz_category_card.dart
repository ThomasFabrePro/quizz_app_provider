import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizz/quizz_category_model.dart';

class QuizzCategoryCard extends StatelessWidget {
  final Quizz quizzCategory;
  const QuizzCategoryCard({super.key, required this.quizzCategory});

  @override
  Widget build(BuildContext context) {
    print("build ${quizzCategory.name}");
    return ChangeNotifierProvider(
      create: (context) => quizzCategory,
      child: GestureDetector(
        onTap: quizzCategory.isLoading
            ? null
            : () {
                quizzCategory.getQuizzQuestions().then((_) {
                  if (quizzCategory.quizzQuestions.isNotEmpty) {
                    context.go("/quizz_game", extra: quizzCategory);
                  } else {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                        const SnackBar(
                            backgroundColor: Colors.red,
                            content: Text('Aucune question disponible')),
                      );
                  }
                });
              },
        child: Container(
          width: double.infinity,
          height: 70,
          decoration: const BoxDecoration(
              color: ThemeConfig.secondaryColor,
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(90),
                  bottomLeft: Radius.circular(90),
                  bottomRight: Radius.circular(90)),
              border: Border.fromBorderSide(BorderSide(
                color: ThemeConfig.primaryColor,
                width: 1,
              ))),
          child: quizzCategory.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    // image: DecorationImage(
                    //   image: AssetImage('assets/quizz_category.png'),
                    //   fit: BoxFit.cover,
                    // ),

                    Positioned(
                      left: 8,
                      child: Text(
                        quizzCategory.name,
                        style: const TextStyle(
                          color: ThemeConfig.primaryColor,
                          fontSize: 24,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
