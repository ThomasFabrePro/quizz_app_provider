import 'dart:math';

import 'package:flutter/material.dart' show Color;
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/stat.dart';

User user = const User(id: '0', email: '', pseudo: '');

class User {
  final String id;
  final String email;
  final String pseudo;
  final List<Stat> stats;
  const User(
      {required this.id,
      required this.email,
      required this.pseudo,
      this.stats = const <Stat>[]});

  User fromJson(dynamic json) {
    final String id = json["_id"];
    final String email = json["email"];
    final String pseudo = json["pseudo"];
    List<Stat> statsFromJson = [];
    if (json["stats"] != null) {
      List<Color> colorList = [];
      for (var stat in json["stats"]) {
        //?Give a random color to each stat
        if (colorList.isEmpty) {
          colorList = List.from(ThemeConfig.statBarColorList);
        }
        int colorIndex = Random().nextInt(colorList.length);
        Color color = colorList[colorIndex];
        colorList.removeAt(colorIndex);
        //?
        statsFromJson.add(Stat(
            quizzCategory: stat["category"],
            rightAnswers: stat["right"],
            wrongAnswers: stat["wrong"],
            barColor: color));
      }
      statsFromJson
          .sort((a, b) => a.prctRightAnswers.compareTo(b.prctRightAnswers));
    }

    return User(id: id, email: email, pseudo: pseudo, stats: statsFromJson);
  }
}
