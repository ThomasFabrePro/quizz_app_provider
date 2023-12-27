import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/services/contact_list_service.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/web_service/repositories/contact_repository.dart';
import 'package:quizz_app_provider/widgets/buttons/add_contact_button.dart';
import 'package:quizz_app_provider/widgets/buttons/pending_contact_invitation.dart';
import 'package:quizz_app_provider/widgets/contacts/contact_list.dart';
import 'package:quizz_app_provider/widgets/contacts/contact_search_bar.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      appBarText: 'Contacts',
      floatingActionButton: PendingContactInvitation(),
      child: ContactsPageContent(),
    );
  }
}

class ContactsPageContent extends StatelessWidget {
  const ContactsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      // create: (context) => user,
      create: (context) =>
          ContactListService(contactRepository: ContactRepository()),
      child: const Column(children: [
        ContactSearchBar(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 8.0),
          child: Divider(
            color: ThemeConfig.primaryColor,
            thickness: 1,
            indent: 32,
            endIndent: 32,
          ),
        ),
        Expanded(child: ContactListView()),
      ]),
    );
  }
}
