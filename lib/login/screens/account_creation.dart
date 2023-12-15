import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';
import 'package:quizz_app_provider/login/widgets/create_account_button.dart';
import 'package:quizz_app_provider/login/widgets/email_input.dart';
import 'package:quizz_app_provider/login/widgets/password_input.dart';
import 'package:quizz_app_provider/login/widgets/pseudo_input.dart';

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
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image(
                            image: AssetImage('assets/logo_small.png'),
                            height: 200,
                          ),
                        ),
                        SizedBox(height: 80),
                        EmailInput(),
                        SizedBox(height: 16),
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
      ),
    );
  }
}
