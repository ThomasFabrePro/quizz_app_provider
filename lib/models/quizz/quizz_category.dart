// import 'dart:typed_data';

class QuizzCategory {
  final String name;
  final String description;
  // final Uint8List image;

  QuizzCategory({
    required this.name,
    required this.description,
    // this.image
  });

  factory QuizzCategory.fromJson(Map<String, dynamic> json) {
    return QuizzCategory(
      name: json['name'],
      description: json['description'],
      // image: json['image']
    );
  }
}
