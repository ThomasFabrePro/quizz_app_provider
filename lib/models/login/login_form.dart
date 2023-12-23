import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import 'login_models.dart';

class LoginForm extends ChangeNotifier with FormzMixin {
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
