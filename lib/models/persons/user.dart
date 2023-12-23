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
    _setContactListFromJson(json["contacts"]);
    return User(
      id: id,
      email: email,
      pseudo: pseudo,
      stats: stats,
      contacts: contacts,
    );
  }

  void _setStatListFromJson(dynamic statsFromJson) {
    stats = [];
    if (statsFromJson != null) {
      for (var stat in statsFromJson) {
        stats.add(Stat.fromJson(stat));
      }
      _sortStatList();
    }
  }

  void _setContactListFromJson(dynamic contactsFromJson) {
    contacts = [];
    if (contactsFromJson != null) {
      for (var contact in contactsFromJson) {
        contacts.add(Contact.fromJson(contact));
      }
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
