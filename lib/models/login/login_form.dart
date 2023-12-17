import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:quizz_app_provider/web_service/auth_user.dart';
import 'package:quizz_app_provider/web_service/connect_user.dart';
import 'package:quizz_app_provider/web_service/create_user.dart';

import 'login_models.dart';

class LoginForm extends ChangeNotifier
    with FormzMixin, ConnectUser, CreateUser {
  LoginForm({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.pseudo = const Pseudo.pure(),
  });

  Email email;
  Password password;
  Pseudo pseudo;

  @override
  List<FormzInput> get inputs => [email, password];

  set newPassword(String value) {
    final newPassword = Password.dirty(value);
    password = newPassword;
    notifyListeners();
  }

  set newEmail(String value) {
    final newEmail = Email.dirty(value);
    email = newEmail;
    notifyListeners();
  }

  set newPseudo(String value) {
    final newPseudo = Pseudo.dirty(value);
    pseudo = newPseudo;
    notifyListeners();
  }
}
