import 'package:flutter/material.dart';
import 'package:formz/formz.dart';
import 'package:quizz_app_provider/login/models/password_model.dart';
import 'package:quizz_app_provider/login/models/email_model.dart';

class LoginForm extends ChangeNotifier with FormzMixin {
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

  void printValues() {
    debugPrint("==========================================");
    debugPrint("$inputs");
    debugPrint("login valid: $isValid");
    debugPrint("==========================================");
  }
}
