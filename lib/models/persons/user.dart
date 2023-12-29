import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/web_service/repositories/contact_repository.dart';

User user = User(
    id: '0',
    email: '',
    pseudo: '',
    stats: <Stat>[],
    contacts: <Contact>[],
    pendingContactInvitations: <Contact>[]);

class User {
  final String id;
  final String email;
  final String pseudo;
  List<Stat> stats;
  List<Contact> contacts;
  List<Contact> pendingContactInvitations;

  User(
      {required this.id,
      required this.email,
      required this.pseudo,
      required this.stats,
      required this.contacts,
      required this.pendingContactInvitations});

  ContactRepository contactRepository = ContactRepository();

  User fromJson(dynamic json) {
    final String id = json["_id"];
    final String email = json["email"];
    final String pseudo = json["pseudo"];
    final List<Stat> stats = _setStatListFromJson(json["stats"]);
    final List<Contact> contacts = _setContactListFromJson(json["contacts"]);
    final List<Contact> pendingContactInvitations =
        _setPendingContactInvitationsListFromJson(
            json["pendingContactInvitations"]);
    return User(
      id: id,
      email: email,
      pseudo: pseudo,
      stats: stats,
      contacts: contacts,
      pendingContactInvitations: pendingContactInvitations,
    );
  }

  User fromUser(User user) {
    return User(
      id: user.id,
      email: user.email,
      pseudo: user.pseudo,
      stats: user.stats,
      contacts: user.contacts,
      pendingContactInvitations: pendingContactInvitations,
    );
  }

  List<Stat> _setStatListFromJson(dynamic statsFromJson) {
    List<Stat> stats = <Stat>[];
    if (statsFromJson != null) {
      for (var stat in statsFromJson) {
        stats.add(Stat.fromJson(stat));
      }
      _sortStatList();
    }
    return stats;
  }

  List<Contact> _setContactListFromJson(dynamic contactsFromJson) {
    List<Contact> contacts = <Contact>[];
    if (contactsFromJson != null) {
      for (var contact in contactsFromJson) {
        contacts.add(Contact.fromJson(contact));
      }
    }
    return contacts;
  }

  List<Contact> _setPendingContactInvitationsListFromJson(
      dynamic pendingContactInvitationsFromJson) {
    List<Contact> pendingContactInvitations = <Contact>[];
    if (pendingContactInvitationsFromJson != null) {
      for (var contact in pendingContactInvitationsFromJson) {
        pendingContactInvitations.add(Contact.fromJson(contact));
      }
    }
    return pendingContactInvitations;
  }

  void updateStat(Stat quizzStat) {
    bool statDoesExist =
        stats.any((stat) => stat.categoryName == quizzStat.categoryName);
    if (statDoesExist) {
      Stat statToUpdate = stats
          .firstWhere((stat) => stat.categoryName == quizzStat.categoryName);
      statToUpdate
        ..rightAnswers += quizzStat.rightAnswers
        ..wrongAnswers += quizzStat.wrongAnswers;
    } else {
      stats.add(quizzStat);
    }
    _sortStatList();
  }

  void _sortStatList() {
    stats.sort((a, b) => b.prctRightAnswers.compareTo(a.prctRightAnswers));
  }

  Future<void> fetchAllContactsLists() async {
    (List<Contact>, List<Contact>) result =
        await contactRepository.fetchAllContactsLists();
    contacts = result.$1;
    pendingContactInvitations = result.$2;
  }

  Future<void> fetchContacts() async {
    contacts = await contactRepository.fetchContacts();
  }
}
