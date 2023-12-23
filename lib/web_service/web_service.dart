//import hhtp package

import 'package:shared_preferences/shared_preferences.dart';

class WebService {
  const WebService();
  // static const String baseUrl = 'https://b347-86-237-94-35.ngrok.io';
  static const String baseUrl = 'http://10.0.0.25:80';
  // static const String baseUrl = 'http://192.168.1.20:80';
}

mixin DisconnectUser {
  void disconnectUser() {
    SharedPreferences.getInstance().then((value) {
      value.remove('email');
      value.remove('password');
    });
  }
}
