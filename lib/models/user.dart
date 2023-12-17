User user = const User(pseudo: '');

class User {
  final String pseudo;
  const User({required this.pseudo});

  User fromJson(dynamic json) {
    return User(pseudo: json["pseudo"]);
  }
}
