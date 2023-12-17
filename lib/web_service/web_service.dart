//import hhtp package
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizz_app_provider/common/authentication_status.dart';
import 'package:quizz_app_provider/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  static const String _baseUrl = 'http://10.0.0.25:80';
}

mixin ConnectUser {
  Future<AuthenticationStatus> connectUser(
      String email, String password) async {
    const String path = '/api/auth/login';
    String url = WebService._baseUrl + path;
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
        dynamic data = jsonDecode(response.body);
        user = user.copyWith(pseudo: data["user"]['pseudo']);
        SharedPreferences.getInstance().then((value) {
          value.setString('email', email);
          value.setString('password', password);
        });
        return AuthenticationStatus.authenticated;
      } else {
        return AuthenticationStatus.failed;
      }
    } catch (e) {
      return AuthenticationStatus.unauthenticated;
    }
  }
}
mixin CreateUser {
  Future<AuthenticationStatus> createUser(
      String email, String password, String pseudo) async {
    const String path = '/api/auth/register';
    String url = WebService._baseUrl + path;
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
      return AuthenticationStatus.failed;
    }
  }
}

mixin DisconnectUser {
  void disconnectUser() {
    SharedPreferences.getInstance().then((value) {
      value.remove('email');
      value.remove('password');
    });
  }
}
