import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizz/quizz_category_model.dart';
import 'package:quizz_app_provider/models/quizz/quizz_question_model.dart';

class QuizzGame extends ChangeNotifier {
  final Quizz quizz;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  bool isFinished = false;

  QuizzGame({required this.quizz});

  void answerQuestion(int index) {
    QuizzQuestion question = quizz.quizzQuestions[currentQuestionIndex];
    question.selectedOptionIndex = index;
    if (question.correctOptionIndex == index) {
      correctAnswers++;
    } else {
      wrongAnswers++;
    }
    question.isAnswered = true;

    notifyListeners();
  }

  void nextQuestion() {
    if (currentQuestionIndex < quizz.quizzQuestions.length - 1) {
      currentQuestionIndex++;
    } else {
      isFinished = true;
    }
    notifyListeners();
  }
}
