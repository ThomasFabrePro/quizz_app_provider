import 'dart:math';

import 'package:flutter/material.dart' show Color, ChangeNotifier;
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/persons/contact.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/web_service/update_stats.dart';

User user = User(id: '0', email: '', pseudo: '');

class User extends ChangeNotifier with UpdateStats {
  final String id;
  final String email;
  final String pseudo;
  List<Stat> stats;
  List<Contact> contacts;
  User(
      {required this.id,
      required this.email,
      required this.pseudo,
      this.stats = const <Stat>[],
      this.contacts = const <Contact>[]});

  User fromJson(dynamic json) {
    final String id = json["_id"];
    final String email = json["email"];
    final String pseudo = json["pseudo"];
    setStatList(json["stats"]);
    return User(
      id: id,
      email: email,
      pseudo: pseudo,
      stats: stats,
    );
  }

  void setStatList(dynamic statsFromJson) {
    stats = [];
    if (statsFromJson != null) {
      // List<Color> colorList = [];
      for (var stat in statsFromJson) {
        // //?Give a random color to each stat
        // if (colorList.isEmpty) {
        //   colorList = List.from(ThemeConfig.statBarColorList);
        // }
        // int colorIndex = Random().nextInt(colorList.length);
        // Color color = colorList[colorIndex];
        // colorList.removeAt(colorIndex);
        // //?
        stats.add(Stat(
          quizzCategory: stat["category"],
          rightAnswers: stat["right"],
          wrongAnswers: stat["wrong"],
          // barColor: color
        ));
      }
      stats.sort((a, b) => b.prctRightAnswers.compareTo(a.prctRightAnswers));
    }
  }
}
