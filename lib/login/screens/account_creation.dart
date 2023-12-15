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
                        EmailInput(),
                        SizedBox(height: 8),
                        PasswordInput(),
                        SizedBox(height: 8),
                        PseudoInput(),
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
