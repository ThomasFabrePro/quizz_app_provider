import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/authentication_status.dart';
import 'package:quizz_app_provider/models/user.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

mixin CreateUser {
  Future<AuthenticationStatus> createUser(
      String email, String password, String pseudo) async {
    const String path = '/api/auth/register';
    String url = WebService.baseUrl + path;
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
      if (response.statusCode == 201) {
        dynamic data = jsonDecode(response.body);
        user = user.fromJson(data["user"]);

        SharedPreferences.getInstance().then((value) {
          value.setString('email', email);
          value.setString('password', password);
        });
        return AuthenticationStatus.authenticated;
      }
      if (response.statusCode == 401) {
        return AuthenticationStatus.unauthenticated;
      }
      return AuthenticationStatus.failed;
    } catch (e) {
      debugPrint("ERROR ON CREATE USER $e");
      return AuthenticationStatus.failed;
    }
  }
}
