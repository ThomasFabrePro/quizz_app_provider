import 'dart:convert';

import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_question_model.dart';
import 'package:quizz_app_provider/web_service/repositories/quizzes/quizz_service.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;

///Responsible for communicating with the API for our quizzes
class SoloQuizzRepository extends WebService implements QuizzRepository {
  const SoloQuizzRepository();
  @override
  Future<List<Quizz>> getQuizzCategories() async {
    const String path = '/api/quizzes/categories';
    String url = baseUrl + path;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        dynamic categories = jsonDecode(response.body);
        List<Quizz> quizzCategories = [];
        for (var category in categories["quizzCategories"]) {
          quizzCategories.add(Quizz.fromJson(category, this));
        }
        return quizzCategories;
      } else {
        throw Exception(
            'Response status code : ${response.statusCode} :: Failed to load quizz categories');
      }
    } catch (e) {
      throw Exception('Server failed : $e');
    }
  }

  @override
  Future<List<QuizzQuestion>> getQuizzQuestions(String category) async {
    final String path = '/api/quizzes/${category.toLowerCase()}';
    String url = baseUrl + path;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );

      if (response.statusCode == 200) {
        dynamic questions = jsonDecode(response.body);
        List<QuizzQuestion> quizzQuestions = [];
        for (var question in questions) {
          quizzQuestions.add(QuizzQuestion.fromJson(question));
        }
        return quizzQuestions;
      } else {
        throw Exception(
            'Response status code : ${response.statusCode} :: Failed to load quizz questions');
      }
    } catch (e) {
      throw Exception('Server failed : $e');
    }
  }
}
