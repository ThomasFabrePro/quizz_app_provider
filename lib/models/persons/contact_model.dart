class Contact {
  final String id;
  final String pseudo;
  bool invitationAccepted;
  Contact(
      {required this.id,
      required this.pseudo,
      this.invitationAccepted = false});

  factory Contact.fromJson(dynamic json) {
    final String id = json["id"];
    final String pseudo = json["pseudo"];
    final bool invitationAccepted = json["invitationAccepted"];

    return Contact(
        id: id, pseudo: pseudo, invitationAccepted: invitationAccepted);
  }
}
