import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/models/services/contact_list_service.dart';
import 'package:quizz_app_provider/widgets/contacts/add_contact_card.dart';
import 'package:quizz_app_provider/widgets/contacts/contact_card.dart';

class ContactListView extends StatelessWidget {
  const ContactListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactListService>(builder: (context, service, child) {
      return user.contacts.isNotEmpty
          ? ListView.builder(
              itemCount: user.contacts.length,
              itemBuilder: (context, index) {
                Contact contact = user.contacts[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ContactCard(
                    pseudo: contact.pseudo,
                    trailing: IconButton(
                      icon:
                          const Icon(Icons.delete, color: Colors.red, size: 30),
                      onPressed: () async {
                        await service.removeContact(contact);
                      },
                    ),
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'Vous n\'avez pas encore de contacts',
                textAlign: TextAlign.center,
              ),
            );
    });
  }
}
