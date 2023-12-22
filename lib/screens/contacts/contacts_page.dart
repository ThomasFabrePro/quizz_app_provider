import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/persons/contact.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/models/quizzes/quizz_model.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/widgets/buttons/add_contact_button.dart';
import 'package:quizz_app_provider/widgets/quizz/quizz_category_card.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BasePage(
      appBarText: 'Contacts',
      floatingActionButton: AddContactButton(),
      child: ContactsPageContent(),
    );
  }
}

class ContactsPageContent extends StatelessWidget {
  const ContactsPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      SizedBox(
          height: height * 0.8,
          child: user.contacts.isNotEmpty
              ? ListView.builder(
                  itemCount: user.contacts.length,
                  itemBuilder: (context, index) {
                    Contact contact = user.contacts[index];
                    return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: ListTile(
                          title: Text(contact.pseudo),
                          // subtitle: Text(contact.email),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              user.contacts.removeAt(index);
                            },
                          ),
                        ));
                  },
                )
              : Center(
                  child: Text('Vous n\'avez pas encore de contacts'),
                )),
    ]);
  }
}
