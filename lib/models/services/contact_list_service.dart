import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/web_service/repositories/contact_repository.dart';

class ContactListService extends ChangeNotifier {
  //contact repository testé ici pour l'inversion de dépendance,
  //Mais pas d'utilité finalement donc on pourrait le repasser à l'instanciation directe
  //De la classe plutot que de passer par le constructeur
  ContactRepository contactRepository;
  Contact? contactFetchedFromSearchBar;
  ContactListService({required this.contactRepository});

  List<Contact> get contactList => user.contacts;

  Future<void> addContact() async {
    Contact? contact = contactFetchedFromSearchBar;
    if (contact == null || contact.id == user.id) return;
    await contactRepository.addContact(contact.id).then((value) {
      contactList.add(contact);
    });

    contactFetchedFromSearchBar = null;
    notifyListeners();
  }

  Future<void> removeContact(Contact contact) async {
    await contactRepository.removeContact(contact.id);
    contactList.remove(contact);
    notifyListeners();
  }

  Future<String> searchContact(String pseudo) async {
    if (contactList.any((element) => element.pseudo == pseudo)) {
      return 'Vous êtes déjà ami avec $pseudo';
    }
    contactFetchedFromSearchBar =
        await ContactRepository().getContactByPseudo(pseudo);
    if (contactFetchedFromSearchBar == null) {
      return 'Aucun utilisateur trouvé avec ce pseudo';
    }
    notifyListeners();
    return '';
  }
}
