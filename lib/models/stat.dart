// import 'dart:math';

import 'package:flutter/material.dart' show Color, Colors;
// import 'package:quizz_app_provider/common/theme.dart';

class Stat {
  final String quizzCategory;
  final int rightAnswers;
  final int wrongAnswers;
  final Color barColor;
  const Stat({
    required this.quizzCategory,
    required this.rightAnswers,
    required this.wrongAnswers,
    this.barColor = Colors.white,
  });

  get totalAnswers => rightAnswers + wrongAnswers;

  get prctRightAnswers => (rightAnswers / totalAnswers) * 100;

  // get barColor => ThemeConfig
  //     .statBarColorList[Random().nextInt(ThemeConfig.statBarColorList.length)];
}
