import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/stat.dart';

class StatBar extends StatelessWidget {
  final Stat stat;
  const StatBar({super.key, required this.stat});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.0,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: ThemeConfig.secondaryColor,
        border: Border.all(
          color: Colors.white30,
          width: 1,
        ),
      ),
      child: FractionallySizedBox(
        alignment: Alignment.centerLeft,
        widthFactor: stat.prctRightAnswers / 100,
        child: Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.0),
              color: stat.barColor,
            ),
          ),
        ),
      ),
    );
  }
}
