import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';

class PseudoInput extends StatelessWidget {
  const PseudoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return TextField(
        key: const Key('loginForm_pseudoInput_textField'),
        onChanged: (pseudo) => loginForm.newPseudo = pseudo,
        decoration: InputDecoration(
          labelText: 'Pseudo',
          errorText: loginForm.pseudo.isNotValid ? 'Pseudo invalide' : null,
        ),
      );
    });
  }
}
