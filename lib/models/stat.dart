// import 'dart:math';

import 'package:flutter/material.dart' show Color, Colors;
// import 'package:quizz_app_provider/common/theme.dart';

class Stat {
  final String categoryName;
  int rightAnswers;
  int wrongAnswers;
  final Color barColor;
  Stat({
    required this.categoryName,
    this.rightAnswers = 0,
    this.wrongAnswers = 0,
    this.barColor = Colors.white,
  });

  Stat.fromJson(dynamic json)
      : categoryName = json["category"],
        rightAnswers = json["right"],
        wrongAnswers = json["wrong"],
        barColor = Colors.white;

  get totalAnswers => rightAnswers + wrongAnswers;

  get prctRightAnswers => ((rightAnswers / totalAnswers) * 100).round();
}
