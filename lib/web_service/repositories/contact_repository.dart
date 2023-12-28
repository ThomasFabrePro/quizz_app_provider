import 'dart:convert';

import 'package:flutter/material.dart' show debugPrint;
import 'package:quizz_app_provider/models/persons/contact_model.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;

class ContactRepository extends WebService {
  Future<Contact?> getContactByPseudo(String pseudo) async {
    final String path = '/api/users/search/$pseudo';
    String url = baseUrl + path;
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 201) {
        dynamic data = jsonDecode(response.body);
        return Contact.fromJson(data);
      } else {
        return null;
      }
    } catch (e) {
      debugPrint("ERROR ON GET CONTACT BY PSEUDO $e");
      return null;
    }
  }

  Future<void> askContact(String contactId) async {
    const String path = '/api/users/ask_contact';
    String url = baseUrl + path;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "userId": user.id,
          "contactId": contactId,
        }),
      );

      if (response.statusCode == 201) {
        debugPrint("CONTACT ASKED");
      } else {
        debugPrint(
            "CONTACT NOT ASKED :: response statusCode ${response.statusCode}");
        throw Error();
      }
    } catch (e) {
      debugPrint("ERROR ON ASK CONTACT $e");
    }
  }

  Future<void> addContact(String contactId) async {
    const String path = '/api/users/add_contact';
    String url = baseUrl + path;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "userId": user.id,
          "contactId": contactId,
        }),
      );

      if (response.statusCode == 201) {
        debugPrint("CONTACT ADDED");
      } else {
        debugPrint(
            "CONTACT NOT ADDED :: response statusCode ${response.statusCode}");
        throw Error();
      }
    } catch (e) {
      debugPrint("ERROR ON ADD CONTACT $e");
    }
  }

  Future<void> removeContact(String contactId) async {
    const String path = '/api/users/remove_contact';
    String url = baseUrl + path;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode({
          "userId": user.id,
          "contactId": contactId,
        }),
      );

      if (response.statusCode == 200) {
        debugPrint("CONTACT REMOVED");
      } else {
        debugPrint(
            "CONTACT NOT REMOVED :: response statusCode ${response.statusCode}");
        throw Error();
      }
    } catch (e) {
      debugPrint("ERROR ON REMOVE CONTACT $e");
    }
  }

  Future<
      (
        List<Contact> contactsList,
        List<Contact> pendingContactInvitationsList
      )> fetchContactsDatas() async {
    final String path = '/api/users/${user.id}/contacts';
    String url = baseUrl + path;
    List<Contact> contactsList = [];
    List<Contact> pendingContactInvitationsList = [];
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
      );
      if (response.statusCode == 201) {
        dynamic data = jsonDecode(response.body);
        for (var contact in data['contacts']) {
          contactsList.add(Contact.fromJson(contact));
        }
        for (var contact in data['pendingContactInvitations']) {
          pendingContactInvitationsList.add(Contact.fromJson(contact));
        }
      }
      // return (contactsList, pendingContactInvitationsList);
    } catch (e) {
      debugPrint("ERROR ON GET CONTACT BY PSEUDO $e");
      // return (contactsList, pendingContactInvitationsList);
    }
    return (contactsList, pendingContactInvitationsList);
  }
}
