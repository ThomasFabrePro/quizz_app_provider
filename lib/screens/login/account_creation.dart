import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/models/login/login_form.dart';
import 'package:quizz_app_provider/screens/login/base_login.dart';
import 'package:quizz_app_provider/widgets/login/create_account_button.dart';
import 'package:quizz_app_provider/widgets/login/email_input.dart';
import 'package:quizz_app_provider/widgets/login/password_input.dart';
import 'package:quizz_app_provider/widgets/login/pseudo_input.dart';

class AccountCreationPage extends StatelessWidget {
  const AccountCreationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLoginPage(
      appBarText: 'Création de compte',
      child: AccountCreationPageContent(),
    );
  }
}

class AccountCreationPageContent extends StatelessWidget {
  const AccountCreationPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
              create: (context) => LoginForm(),
              child: Builder(
                builder: (context) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Align(
                        alignment: Alignment.topCenter,
                        child: Image(
                          image: AssetImage('assets/logo_large.png'),
                          height: 200,
                        ),
                      ),
                      SizedBox(height: 80),
                      PasswordInput(),
                      SizedBox(height: 16),
                      PseudoInput(),
                      SizedBox(height: 40),
                      CreateAccountButton()
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
