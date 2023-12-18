// import 'dart:typed_data';

class QuizzCategory {
  final String name;
  final String description;

  QuizzCategory({
    required this.name,
    required this.description,
  });

  factory QuizzCategory.fromJson(Map<String, dynamic> json) {
    return QuizzCategory(
      name: json['name'],
      description: json['description'],
    );
  }
}
