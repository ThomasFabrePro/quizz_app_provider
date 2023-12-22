import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';

class QuizzCategoryCard extends StatelessWidget {
  final Quizz quizz;
  const QuizzCategoryCard({super.key, required this.quizz});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => quizz,
      child: GestureDetector(
        onTap: quizz.isLoading
            ? null
            : () {
                quizz.getQuizzQuestions().then((_) {
                  if (quizz.quizzQuestions.isNotEmpty) {
                    context.go("/quizz_game", extra: quizz);
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
                color: Colors.white,
                // color: ThemeConfig.primaryColor,
                width: 0.5,
              ))),
          child: quizz.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Stack(
                  children: [
                    // image: DecorationImage(
                    //   image: AssetImage('assets/quizz_category.png'),
                    //   fit: BoxFit.cover,
                    // ),
                    Center(
                      // left: 8,
                      child: Text(
                        quizz.name,
                        style: const TextStyle(
                          color: ThemeConfig.primaryColor,
                          fontSize: 24,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Positioned(
                    //   left: 8,
                    //   child: Text(
                    //     quizz.name,
                    //     style: const TextStyle(
                    //       color: ThemeConfig.primaryColor,
                    //       fontSize: 24,
                    //       // fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
        ),
      ),
    );
  }
}
