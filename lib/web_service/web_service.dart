//import hhtp package
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quizz_app_provider/login/authentication_status.dart';

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
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
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
  Future<AuthenticationStatus> createUser(String email, String password) async {
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
        }),
      );
      if (response.statusCode == 200) {
        dynamic data = jsonDecode(response.body);
        return AuthenticationStatus.authenticated;
      } else {
        return AuthenticationStatus.failed;
      }
    } catch (e) {
      return AuthenticationStatus.unauthenticated;
    }
  }
}
