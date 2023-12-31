import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/common/authentication_status.dart';
import 'package:quizz_app_provider/models/login/login_form.dart';
import 'package:quizz_app_provider/web_service/repositories/user_repository.dart';

class CreateAccountButton extends StatelessWidget {
  const CreateAccountButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(ThemeConfig.primaryColor),
        ),
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: loginForm.isValid
            ? () async {
                await UserRepository()
                    .createUser(loginForm.email.value, loginForm.password.value,
                        loginForm.pseudo.value)
                    .then((value) {
                  switch (value) {
                    case AuthenticationStatus.authenticated:
                      context.go('/home');
                      break;
                    case AuthenticationStatus.unauthenticated:
                      ScaffoldMessenger.of(context)
                        ..hideCurrentSnackBar()
                        ..showSnackBar(
                          const SnackBar(
                              backgroundColor: Colors.red,
                              content: Text('Identifiants invalides')),
                        );
                      break;
                    case AuthenticationStatus.failed:
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
                        content: Text('Identifiants invalides')),
                  );
              },
        child: const Text('CRÉER MON COMPTE',
            style: TextStyle(color: ThemeConfig.tertiaryColor)),
      );
    });
  }
}
