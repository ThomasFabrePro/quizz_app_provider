class Contact {
  final String id;
  final String pseudo;
  const Contact({required this.id, required this.pseudo});

  factory Contact.fromJson(dynamic json) {
    final String id = json["id"];
    final String pseudo = json["pseudo"];

    return Contact(id: id, pseudo: pseudo);
  }
}
