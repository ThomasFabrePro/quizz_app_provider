// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizz/quizz_question_model.dart';
import 'package:quizz_app_provider/web_service/retrieve_quizz_questions.dart';

class Quizz with ChangeNotifier, RetrieveQuizzQuestions {
  final String name;
  final String description;
  List<QuizzQuestion> quizzQuestions;
  bool isLoading = false;

  Quizz({
    required this.name,
    required this.description,
    this.quizzQuestions = const <QuizzQuestion>[],
  });

  factory Quizz.fromJson(Map<String, dynamic> json) {
    return Quizz(
      name: json['name'],
      description: json['description'],
    );
  }

  Future<void> getQuizzQuestions() async {
    isLoading = true;
    notifyListeners();
    quizzQuestions = await retrieveQuizzQuestions(name);
    if (quizzQuestions.isNotEmpty) {
      isLoading = false;
      notifyListeners();
    }
  }
}
