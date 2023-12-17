import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/authentication_status.dart';
import 'package:quizz_app_provider/web_service/connect_user.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin AuthUser on ConnectUser {
  void authUser(BuildContext context) {
    SharedPreferences.getInstance().then((value) {
      String email = value.getString('email') ?? '';
      String password = value.getString('password') ?? '';
      if (email.isEmpty || password.isEmpty) {
        context.go('/login');
        return;
      }
      connectUser(email, password).then((value) {
        switch (value) {
          case AuthenticationStatus.authenticated:
            context.go('/home');
            break;
          default:
            context.go('/login');
            break;
        }
      });
    });
  }
}
