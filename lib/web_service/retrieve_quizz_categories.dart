import 'dart:convert';

import 'package:quizz_app_provider/models/quizz/quizz_category.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;

mixin RetrieveQuizzCategories {
  Future<List<QuizzCategory>> retrieveQuizzCategories() async {
    const String path = '/api/quizzes/categories';
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
        dynamic categories = jsonDecode(response.body);
        List<QuizzCategory> quizzCategories = [];
        for (var category in categories["quizzCategories"]) {
          quizzCategories.add(QuizzCategory.fromJson(category));
        }
        return quizzCategories;
      } else {
        throw Exception(
            'Response status code : ${response.statusCode} :: Failed to load quizz categories');
      }
    } catch (e) {
      throw Exception('Server failed : $e');

      // return AuthenticationStatus.unauthenticated;
    }
  }
}
