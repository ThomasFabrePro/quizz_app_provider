import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/persons/contact_model.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;
  final IconButton trailing;
  const ContactCard({
    super.key,
    required this.contact,
    required this.trailing,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: contact.invitationAccepted ? Colors.white70 : Colors.white30,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white30,
          width: 1,
        ),
      ),
      child: ListTile(
        title: Text(
          contact.pseudo,
          // style: const TextStyle(color: Colors.white),
        ),
        trailing: trailing,
      ),
    );
  }
}
