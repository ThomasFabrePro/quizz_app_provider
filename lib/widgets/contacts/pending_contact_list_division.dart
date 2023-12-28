import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/services/contact_list_service.dart';
import 'package:quizz_app_provider/widgets/contacts/cards/add_contact_card.dart';

class PendingContactListDivision extends StatelessWidget {
  const PendingContactListDivision({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ContactListService>(builder: (context, service, child) {
      return service.pendingContactInvitationsList.isNotEmpty
          ? ListView.builder(
              itemCount: service.pendingContactInvitationsList.length,
              itemBuilder: (context, index) {
                Contact contact = service.pendingContactInvitationsList[index];
                return Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: AddContactCard(
                    pseudo: contact.pseudo,
                    onPressedAdd: () async {
                      await service.addContact(contact);
                    },
                    onPressedRemove: () async {
                      await service.removeContact(contact);
                    },
                  ),
                );
              },
            )
          : const Center(
              child: Text(
                'Aucune invitation en attente',
                textAlign: TextAlign.center,
              ),
            );
    });
  }
}
