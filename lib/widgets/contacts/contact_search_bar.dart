import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/services/contact_list_service.dart';
import 'package:quizz_app_provider/widgets/contacts/contact_card.dart';

class ContactSearchBar extends StatefulWidget {
  const ContactSearchBar({Key? key}) : super(key: key);

  @override
  State<ContactSearchBar> createState() => _ContactSearchBarState();
}

class _ContactSearchBarState extends State<ContactSearchBar> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ContactListService>(
      builder: (context, service, child) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                onSubmitted: (value) async {
                  service.searchContact(value).then((value) {
                    if (service.contactFetchedFromSearchBar == null) {
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          SnackBar(
                              backgroundColor: Colors.red,
                              content: Text(value)),
                        );
                    }
                  });
                },
                style: const TextStyle(color: Colors.white),
                cursorColor: ThemeConfig.primaryColor,
                decoration: const InputDecoration(
                  labelText: 'Chercher un pseudo',
                  labelStyle: TextStyle(color: Colors.white),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        BorderSide(width: 2, color: ThemeConfig.primaryColor),
                  ),
                  prefixIcon: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Visibility(
              visible: service.contactFetchedFromSearchBar != null,
              child: ContactCard(
                pseudo: service.contactFetchedFromSearchBar?.pseudo ?? "",
                trailing: IconButton(
                  icon: const Icon(
                    Icons.add,
                    color: ThemeConfig.primaryColor,
                  ),
                  onPressed: () async {
                    await service.addContact();
                  },
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
