import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_question_model.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/web_service/repositories/quizzes/quizz_service.dart';
import 'package:quizz_app_provider/web_service/repositories/user_repository.dart';

// abstract class Quizz {
//   final String name = "";
//   final String url = "";
//   // String opponentId = '';
//   List<QuizzQuestion> quizzQuestions = const <QuizzQuestion>[];
//   bool isLoading = false;
//   int currentQuestionIndex = 0;
//   List<bool?> answersTracker = [null, null, null, null];
//   int correctAnswers = 0;
//   int wrongAnswers = 0;
//   bool isFinished = false;
//   // late QuizzRepository quizzRepository;
//   // Quizz({
//   //   required this.name,
//   //   required this.url,
//   //   this.quizzQuestions = const <QuizzQuestion>[],
//   // });

//   // factory Quizz.fromJson(Map<String, dynamic> json) {
//   // return Quizz(
//   //   name: json['name'],
//   //   url: json['url'],
//   // );
//   // }

//   List<String> get options => quizzQuestions[currentQuestionIndex].options;

//   bool get actualQuestionIsAnswered =>
//       quizzQuestions[currentQuestionIndex].isAnswered;

//   String get actualQuestionText =>
//       quizzQuestions[currentQuestionIndex].question;

//   QuizzQuestion get actualQuestion => quizzQuestions[currentQuestionIndex];

//   String get score => "$correctAnswers / ${quizzQuestions.length}";

//   Future<void> fetchQuizzQuestions() async {
//     isLoading = true;
//     notifyListeners();
//     quizzQuestions = await const QuizzRepository().fetchQuizzQuestions(url);
//     if (quizzQuestions.isNotEmpty) {
//       isLoading = false;
//       notifyListeners();
//     }
//   }

//   void answerQuestion(int index) {
//     // if (!question.isAnswered) {
//     //   question.selectedOptionIndex = index;
//     //   if (question.correctOptionIndex == index) {
//     //     answersTracker[currentQuestionIndex] = true;
//     //     correctAnswers++;
//     //   } else {
//     //     answersTracker[currentQuestionIndex] = false;
//     //     wrongAnswers++;
//     //   }
//     //   question.isAnswered = true;

//     //   notifyListeners();
//     // }
//   }

//   Future<void> nextQuestion() async {
//     // if (currentQuestionIndex < quizzQuestions.length - 1) {
//     //   currentQuestionIndex++;
//     // } else {
//     //   await UserRepository().updateStat(Stat(
//     //       categoryName: name,
//     //       rightAnswers: correctAnswers,
//     //       wrongAnswers: wrongAnswers));
//     //   isFinished = true;
//     // }
//     // notifyListeners();
//   }
// }

class Quizz extends ChangeNotifier {
  final String name;
  final String url;
  List<QuizzQuestion> quizzQuestions;
  bool isLoading;
  int currentQuestionIndex;
  List<bool?> answersTracker;
  int correctAnswers;
  int wrongAnswers;
  bool isFinished;
  QuizzRepository quizzRepository;
  Quizz({
    required this.name,
    required this.url,
    required this.quizzRepository,
    this.quizzQuestions = const <QuizzQuestion>[],
    this.answersTracker = const <bool?>[],
    this.correctAnswers = 0,
    this.wrongAnswers = 0,
    this.currentQuestionIndex = 0,
    this.isFinished = false,
    this.isLoading = false,
  });

  factory Quizz.fromJson(
      Map<String, dynamic> json, QuizzRepository quizzRepository) {
    return Quizz(
      name: json['name'],
      url: json['url'],
      quizzRepository: quizzRepository,
    );
  }

  List<String> get options => quizzQuestions[currentQuestionIndex].options;

  bool get actualQuestionIsAnswered =>
      quizzQuestions[currentQuestionIndex].isAnswered;

  String get actualQuestionText =>
      quizzQuestions[currentQuestionIndex].question;

  QuizzQuestion get actualQuestion => quizzQuestions[currentQuestionIndex];

  String get score => "$correctAnswers / ${quizzQuestions.length}";

  Future<void> fetchQuizzQuestions() async {
    isLoading = true;
    notifyListeners();
    quizzQuestions = await quizzRepository.getQuizzQuestions(url);
    if (quizzQuestions.isNotEmpty) {
      answersTracker = List<bool?>.filled(quizzQuestions.length, null);
      isLoading = false;
      notifyListeners();
    }
  }

  void answerQuestion(int index) {
    if (!actualQuestion.isAnswered) {
      actualQuestion.selectedOptionIndex = index;
      if (actualQuestion.correctOptionIndex == index) {
        answersTracker[currentQuestionIndex] = true;
        correctAnswers++;
      } else {
        answersTracker[currentQuestionIndex] = false;
        wrongAnswers++;
      }
      actualQuestion.isAnswered = true;

      notifyListeners();
    }
  }

  Future<void> nextQuestion() async {
    if (currentQuestionIndex < quizzQuestions.length - 1) {
      currentQuestionIndex++;
    } else {
      await UserRepository().updateStat(Stat(
          categoryName: name,
          rightAnswers: correctAnswers,
          wrongAnswers: wrongAnswers));
      isFinished = true;
    }
    notifyListeners();
  }
}
