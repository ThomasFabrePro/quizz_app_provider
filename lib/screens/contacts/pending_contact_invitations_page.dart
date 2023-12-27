import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/widgets/contacts/add_contact_card.dart';
import 'package:quizz_app_provider/widgets/contacts/contact_card.dart';

class PendingContactInvitationsPage extends StatelessWidget {
  const PendingContactInvitationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
        appBarText: 'Invitations en attente',
        child: PendingContactInvitationsPageContent());
  }
}

class PendingContactInvitationsPageContent extends StatelessWidget {
  const PendingContactInvitationsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Expanded(
          child: user.pendingContactInvitations.isNotEmpty
              ? ListView.builder(
                  itemCount: user.pendingContactInvitations.length,
                  itemBuilder: (context, index) {
                    Contact contact = user.pendingContactInvitations[index];
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: AddContactCard(
                        pseudo: contact.pseudo,
                        onPressed: () async {
                          // await service.removeContact(contact);
                        },
                      ),
                    );
                  },
                )
              : const Center(
                  child: Text(
                    'Aucune demande en attente',
                    textAlign: TextAlign.center,
                  ),
                )),
    );
  }
}
