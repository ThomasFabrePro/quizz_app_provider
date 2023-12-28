import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/web_service/repositories/contact_repository.dart';

class ContactListService extends ChangeNotifier {
  //contact repository testé ici dans le constructeur pour l'inversion de dépendance,
  //Mais pas d'utilité finalement donc on pourrait le repasser à l'instanciation directe
  //De la classe plutot que de passer par le constructeur
  ContactRepository contactRepository;
  Contact? contactFetchedFromSearchBar;
  ContactListService({required this.contactRepository});

  List<Contact> get contactList => user.contacts;
  List<Contact> get pendingContactInvitationsList =>
      user.pendingContactInvitations;

  Future<void> askContact() async {
    Contact? contact = contactFetchedFromSearchBar;
    if (contact == null || contact.id == user.id) return;
    await contactRepository.askContact(contact.id).then((value) {
      contactList.add(contact);
    });

    contactFetchedFromSearchBar = null;
    notifyListeners();
  }

  Future<void> addContact(Contact contactToAdd) async {
    await contactRepository.addContact(contactToAdd.id).then((value) {
      pendingContactInvitationsList.remove(contactToAdd);
      contactList.add(contactToAdd);
    });
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
    if (pendingContactInvitationsList
        .any((element) => element.pseudo == pseudo)) {
      return 'Vous avez déjà envoyé une invitation à $pseudo';
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
