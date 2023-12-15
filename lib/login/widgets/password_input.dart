import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_form.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return TextField(
        key: const Key('loginForm_passwordInput_textField'),
        onChanged: (password) => loginForm.newPassword = password,
        decoration: InputDecoration(
          labelText: 'Mdp',
          errorText:
              loginForm.password.isNotValid ? 'Mot de passe invalide' : null,
        ),
      );
    });
  }
}
