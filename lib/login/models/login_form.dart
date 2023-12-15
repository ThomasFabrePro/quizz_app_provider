import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';

import 'login_models.dart';

class LoginForm extends ChangeNotifier
    with FormzMixin, ConnectUser, CreateUser {
  LoginForm({
    this.email = const Email.pure(),
    this.password = const Password.pure(),
  });

  Email email;
  Password password;

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
}
