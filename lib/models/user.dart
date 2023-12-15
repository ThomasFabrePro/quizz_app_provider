class User {
  final String pseudo;
  const User({required this.pseudo});

  User copyWith({String? pseudo}) {
    return User(pseudo: pseudo ?? this.pseudo);
  }
}
