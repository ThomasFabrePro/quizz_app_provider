import 'dart:convert';

import 'package:flutter/material.dart' show debugPrint;
import 'package:quizz_app_provider/common/authentication_status.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/models/stat.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

///Responsible for communicating with the API for our user
class UserRepository extends WebService {
  Future<bool> authUser() async {
    return await SharedPreferences.getInstance().then((value) {
      String email = value.getString('email') ?? '';
      String password = value.getString('password') ?? '';
      if (email.isEmpty || password.isEmpty) {
        return false;
      }
      return connectUser(email, password).then((value) {
        switch (value) {
          case AuthenticationStatus.authenticated:
            return true;
          default:
            return false;
        }
      });
    });
  }

  Future<AuthenticationStatus> connectUser(
      String email, String password) async {
    const String path = '/api/auth/login';
    String url = baseUrl + path;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 201) {
        _updateUserObject(response.body);
        _saveUserAuthenticationInformations(email, password);
        return AuthenticationStatus.authenticated;
      } else {
        return AuthenticationStatus.failed;
      }
    } catch (e) {
      debugPrint("ERROR ON CONNECT USER $e");
      return AuthenticationStatus.unauthenticated;
    }
  }

  Future<AuthenticationStatus> createUser(
      String email, String password, String pseudo) async {
    const String path = '/api/auth/register';
    String url = baseUrl + path;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, String>{
          'email': email,
          'password': password,
          'pseudo': pseudo,
        }),
      );
      switch (response.statusCode) {
        case 201:
          _updateUserObject(response.body);
          _saveUserAuthenticationInformations(email, password);
          return AuthenticationStatus.authenticated;
        case 401:
          return AuthenticationStatus.unauthenticated;
        default:
          return AuthenticationStatus.failed;
      }
    } catch (e) {
      debugPrint("ERROR ON CREATE USER $e");
      return AuthenticationStatus.failed;
    }
  }

  Future<void> updateStat(Stat quizzStat) async {
    const String path = '/api/users/update_specific_stat';
    String url = baseUrl + path;
    try {
      final response = await http.post(
        Uri.parse(url),
        headers: <String, String>{
          'Content-Type': 'application/json',
        },
        body: jsonEncode(<String, dynamic>{
          'id': user.id,
          'category': quizzStat.categoryName,
          'right': quizzStat.rightAnswers,
          'wrong': quizzStat.wrongAnswers,
        }),
      );

      if (response.statusCode == 201) {
        user.updateStat(quizzStat);
      }
    } catch (e) {
      debugPrint("ERROR $e");
    }
  }

  void _saveUserAuthenticationInformations(String email, String password) {
    SharedPreferences.getInstance().then((value) {
      value.setString('email', email);
      value.setString('password', password);
    });
  }

  void _updateUserObject(dynamic responseBody) {
    dynamic data = jsonDecode(responseBody);
    user = user.fromJson(data["user"]);
  }
}
