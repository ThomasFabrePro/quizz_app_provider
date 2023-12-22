class Contact {
  final String id;
  final String pseudo;
  const Contact({required this.id, required this.pseudo});

  Contact fromJson(dynamic json) {
    final String id = json["_id"];
    final String pseudo = json["pseudo"];

    return Contact(id: id, pseudo: pseudo);
  }
}
