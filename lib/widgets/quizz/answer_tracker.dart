import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';

class AnswerTracker extends StatelessWidget {
  final bool? isProperlyAnswered;
  const AnswerTracker({super.key, this.isProperlyAnswered});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      width: 20,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isProperlyAnswered == null
            ? Colors.transparent
            : isProperlyAnswered!
                ? ThemeConfig.primaryColor
                : Colors.redAccent,
        border: Border.all(
          color: Colors.white30,
          width: 1,
        ),
      ),
    );
  }
}
