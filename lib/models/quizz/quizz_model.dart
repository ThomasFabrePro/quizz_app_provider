// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizz/quizz_question_model.dart';
import 'package:quizz_app_provider/web_service/retrieve_quizz_questions.dart';

class Quizz extends ChangeNotifier with RetrieveQuizzQuestions {
  final String name;
  final String description;
  List<QuizzQuestion> quizzQuestions;
  bool isLoading = false;
  int currentQuestionIndex = 0;
  List<bool?> answersTracker = [null, null, null, null];
  int correctAnswers = 0;
  int wrongAnswers = 0;
  bool isFinished = false;

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

  List<String> get options => quizzQuestions[currentQuestionIndex].options;

  bool get actualQuestionIsAnswered =>
      quizzQuestions[currentQuestionIndex].isAnswered;

  String get actualQuestionText =>
      quizzQuestions[currentQuestionIndex].question;

  QuizzQuestion get question => quizzQuestions[currentQuestionIndex];

  String get score => "$correctAnswers / ${quizzQuestions.length}";

  Future<void> getQuizzQuestions() async {
    isLoading = true;
    notifyListeners();
    quizzQuestions = await retrieveQuizzQuestions(name);
    if (quizzQuestions.isNotEmpty) {
      isLoading = false;
      notifyListeners();
    }
  }

  void answerQuestion(int index) {
    // QuizzQuestion question = quizzQuestions[currentQuestionIndex];
    if (!question.isAnswered) {
      question.selectedOptionIndex = index;
      if (question.correctOptionIndex == index) {
        answersTracker[currentQuestionIndex] = true;
        correctAnswers++;
      } else {
        answersTracker[currentQuestionIndex] = false;
        wrongAnswers++;
      }
      question.isAnswered = true;

      notifyListeners();
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < quizzQuestions.length - 1) {
      currentQuestionIndex++;
      notifyListeners();
    } else {
      isFinished = true;
    }
  }
}
