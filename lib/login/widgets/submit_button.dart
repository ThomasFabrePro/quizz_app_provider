import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/authentication_status.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: loginForm.isValid
            ? () async {
                await loginForm
                    .connectUser(
                        loginForm.email.value, loginForm.password.value)
                    .then((value) {
                  switch (value) {
                    case AuthenticationStatus.authenticated:
                      context.go('/home');
                      break;
                    case AuthenticationStatus.failed:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Login Failure')),
                        );
                      break;
                    case AuthenticationStatus.unauthenticated:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content:
                                  Text('Le serveur semble ne pas répondre')),
                        );
                      break;
                    default:
                      break;
                  }
                });
              }
            : () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                        backgroundColor: Colors.red,
                        content: Text('Login invalide')),
                  );
              },
        child: const Text('LOGIN'),
      );
    });
  }
}
