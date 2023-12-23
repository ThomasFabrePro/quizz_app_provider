import 'dart:convert';

import 'package:flutter/material.dart' show debugPrint;
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_question_model.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;

///Responsible for communicating with the API for our quizzes
class QuizzRepository extends WebService {
  const QuizzRepository();
  Future<List<Quizz>> fetchQuizzCategories() async {
    const String path = '/api/quizzes/categories';
    String url = WebService.baseUrl + path;
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
          quizzCategories.add(Quizz.fromJson(category));
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

  Future<List<QuizzQuestion>> fetchQuizzQuestions(String category) async {
    final String path = '/api/quizzes/${category.toLowerCase()}';
    String url = WebService.baseUrl + path;
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
