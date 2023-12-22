import 'dart:convert';

import 'package:quizz_app_provider/models/quizzes/quizz_question_model.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;

mixin RetrieveQuizzQuestions {
  Future<List<QuizzQuestion>> retrieveQuizzQuestions(String category) async {
    final String path = '/api/quizzes/${category.toLowerCase()}';
    String url = WebService.baseUrl + path;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        // body: jsonEncode(<String, String>{}),
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

      // return AuthenticationStatus.unauthenticated;
    }
  }
}
