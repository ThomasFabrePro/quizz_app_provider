// import 'dart:math';

import 'package:flutter/material.dart' show ChangeNotifier;
// import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/persons/contact.dart';
import 'package:quizz_app_provider/models/stat.dart';

User user = User(id: '0', email: '', pseudo: '');

class User extends ChangeNotifier {
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
    _setStatListFromJson(json["stats"]);
    return User(
      id: id,
      email: email,
      pseudo: pseudo,
      stats: stats,
    );
  }

  void _setStatListFromJson(dynamic statsFromJson) {
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
          categoryName: stat["category"],
          rightAnswers: stat["right"],
          wrongAnswers: stat["wrong"],
          // barColor: color
        ));
      }
      _sortStatList();
    }
  }

  void updateStat(Stat quizzStat) {
    bool statDoesExist =
        stats.any((stat) => stat.categoryName == quizzStat.categoryName);
    if (statDoesExist) {
      Stat statToUpdate = stats
          .firstWhere((stat) => stat.categoryName == quizzStat.categoryName);
      statToUpdate
        ..rightAnswers += quizzStat.rightAnswers
        ..wrongAnswers += quizzStat.wrongAnswers;
    } else {
      stats.add(quizzStat);
    }
    _sortStatList();
    notifyListeners();
  }

  void _sortStatList() {
    stats.sort((a, b) => b.prctRightAnswers.compareTo(a.prctRightAnswers));
  }
}
