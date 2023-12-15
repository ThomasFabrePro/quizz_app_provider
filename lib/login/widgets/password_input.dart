import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/login_form.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

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
            key: const Key('loginForm_passwordInput_textField'),
            onChanged: (password) => loginForm.newPassword = password,
            style: const TextStyle(color: Colors.white),
            decoration: const InputDecoration(
              border: InputBorder.none,
              labelStyle: TextStyle(color: Colors.white),
              labelText: 'Mdp',
            ),
          );
        }),
      ),
    );
  }
}
