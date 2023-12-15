import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';
import 'package:quizz_app_provider/login/models/pseudo.dart';
import 'package:quizz_app_provider/login/widgets/account_creation_link.dart';
import 'package:quizz_app_provider/login/widgets/email_input.dart';
import 'package:quizz_app_provider/login/widgets/password_input.dart';
import 'package:quizz_app_provider/login/widgets/submit_button.dart';

// import '../models.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: ChangeNotifierProvider(
                create: (context) => LoginForm(pseudo: const Pseudo.dirty('/')),
                child: Builder(
                  builder: (context) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        EmailInput(),
                        PasswordInput(),
                        SizedBox(height: 8),
                        Align(
                            alignment: Alignment.centerRight,
                            child: AccountCreationLink()),
                        SizedBox(height: 8),
                        SubmitButton()
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
