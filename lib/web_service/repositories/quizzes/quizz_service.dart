import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_question_model.dart';

abstract class QuizzRepository {
  Future<List<QuizzQuestion>> getQuizzQuestions(String category) async =>
      <QuizzQuestion>[];
  Future<List<Quizz>> getQuizzCategories() async => throw UnimplementedError();
}
