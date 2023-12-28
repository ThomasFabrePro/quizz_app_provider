import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/services/contact_list_service.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/web_service/repositories/contact_repository.dart';
import 'package:quizz_app_provider/widgets/contacts/pending_contact_list_division.dart';

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
    return ChangeNotifierProvider(
        create: (context) =>
            ContactListService(contactRepository: ContactRepository()),
        child: const PendingContactListDivision());
  }
}
