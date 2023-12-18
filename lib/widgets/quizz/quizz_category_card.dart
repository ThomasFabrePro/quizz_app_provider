import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';

class QuizzCategoryCard extends StatelessWidget {
  final String name;
  const QuizzCategoryCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: GestureDetector(
        onTap: () {
          context.go('/home/quizz_selection/quizz_game');
        },
        // onTap: () => context.go('/home/quizz_selection/quizz'),
        child: Stack(
          children: [
            // image: DecorationImage(
            //   image: AssetImage('assets/quizz_category.png'),
            //   fit: BoxFit.cover,
            // ),

            Positioned(
              left: 8,
              child: Text(
                name,
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
    );
  }
}
