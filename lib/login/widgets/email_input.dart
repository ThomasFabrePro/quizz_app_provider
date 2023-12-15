import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return TextField(
        key: const Key('loginForm_emailInput_textField'),
        onChanged: (email) => loginForm.newEmail = email,
        decoration: InputDecoration(
          labelText: 'Email',
          errorText: loginForm.email.isNotValid ? 'Email invalide' : null,
        ),
      );
    });
  }
}
