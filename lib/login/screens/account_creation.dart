import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';
import 'package:quizz_app_provider/login/screens/login.dart'
    show EmailInput, PasswordInput;

import '../authentication_status.dart';

class AccountCreationPage extends StatelessWidget {
  const AccountCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Creation'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ChangeNotifierProvider(
                create: (context) => LoginForm(),
                child: Builder(
                  builder: (context) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmailInput(),
                        PasswordInput(),
                        SizedBox(height: 8),
                        CreateAccountButton()
                      ],
                    );
                  },
                )),
          ),
        ),
      ),
    );
  }
}

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: loginForm.isValid
            ? () async {
                await loginForm
                    .createUser(loginForm.email.value, loginForm.password.value)
                    .then((value) {});
              }
            : () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Identifiants invalides')),
                  );
              },
        child: const Text('CRÉER MON COMPTE'),
      );
    });
  }
}
