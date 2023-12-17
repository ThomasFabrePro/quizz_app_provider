import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/login/login_form.dart';

class PseudoInput extends StatelessWidget {
  const PseudoInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.25),
              Color.fromRGBO(255, 255, 255, 0.1),
            ]),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white30,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Consumer<LoginForm>(builder: (context, loginForm, child) {
          return TextField(
            key: const Key('loginForm_pseudoInput_textField'),
            onChanged: (pseudo) => loginForm.newPseudo = pseudo,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Pseudo',
            ),
          );
        }),
      ),
    );
  }
}
