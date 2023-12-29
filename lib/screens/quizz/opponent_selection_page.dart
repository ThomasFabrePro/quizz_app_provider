import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/widgets/contacts/cards/contact_card.dart';

class OpponentSelectionPage extends StatelessWidget {
  const OpponentSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
        appBarText: "Duel", child: OpponentSelectionContent());
  }
}

class OpponentSelectionContent extends StatelessWidget {
  const OpponentSelectionContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: ListView.builder(
          itemCount: user.contacts.length,
          itemBuilder: (context, index) {
            Contact contact = user.contacts[index];
            return ContactCard(
              contact: contact,
              trailing: IconButton(
                icon: const Icon(Icons.delete, color: Colors.red, size: 30),
                onPressed: () async {
                  // await service.removeContact(contact);
                },
              ),
            );
          },
        ))
      ],
    );
  }
}
