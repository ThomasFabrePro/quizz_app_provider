import 'package:flutter/material.dart' show Color, Colors;

class QuizzQuestion {
  final String question;
  final List<String> options;
  final int correctOptionIndex;
  int selectedOptionIndex = -1;
  bool isAnswered = false;

  QuizzQuestion({
    required this.question,
    required this.options,
    required this.correctOptionIndex,
  });

  factory QuizzQuestion.fromJson(Map<String, dynamic> json) {
    Map<String, dynamic> jsonOptions = json['options'];
    List<String> options = [];
    for (var option in jsonOptions.entries) {
      options.add(option.value.toString());
    }
    return QuizzQuestion(
      question: json['question'],
      options: options,
      correctOptionIndex: json['correctOptionIndex'],
    );
  }

  List<Color> getOptionColors(int index) {
    if (isAnswered) {
      if (index == correctOptionIndex) {
        return const [Colors.greenAccent, Colors.green];
      } else if (index == selectedOptionIndex) {
        return const [Colors.redAccent, Colors.red];
      }
      return const [
        Color.fromRGBO(255, 255, 255, 0.25),
        Color.fromRGBO(255, 255, 255, 0.1),
      ];
    }
    return const [
      Color.fromRGBO(255, 255, 255, 0.25),
      Color.fromRGBO(255, 255, 255, 0.1),
    ];
  }
}
