import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/screens/base/base_login_page.dart';
import 'package:quizz_app_provider/widgets/login/account_creation_link.dart';
import 'package:quizz_app_provider/widgets/login/email_input.dart';
import 'package:quizz_app_provider/widgets/login/password_input.dart';
import 'package:quizz_app_provider/widgets/login/submit_button.dart';

import '../../models/login/login_models.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const BaseLoginPage(
      appBarText: '',
      child: LoginPageContent(),
    );
  }
}

class LoginPageContent extends StatelessWidget {
  const LoginPageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: ChangeNotifierProvider(
              create: (context) => LoginForm(pseudo: const Pseudo.dirty('/')),
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
                      EmailInput(),
                      SizedBox(height: 16),
                      PasswordInput(),
                      SizedBox(height: 16),
                      Align(
                          alignment: Alignment.centerRight,
                          child: AccountCreationLink()),
                      SizedBox(height: 40),
                      SubmitButton()
                    ],
                  );
                },
              )),
        ),
      ),
    );
  }
}
