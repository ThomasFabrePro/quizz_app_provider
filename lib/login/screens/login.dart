import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/models/login_model.dart';

// import '../models.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: 400),
          child: ChangeNotifierProvider(
              create: (context) => LoginForm(),
              child: Builder(
                builder: (context) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Login'),
                      SizedBox(height: 8),
                      EmailInput(),
                      PasswordInput(),
                      SizedBox(height: 8),
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

class EmailInput extends StatelessWidget {
  const EmailInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return TextField(
        key: const Key('loginForm_emailInput_textField'),
        onChanged: (email) => loginForm.newEmail = email,
        decoration: InputDecoration(
          labelText: 'email',
          errorText: loginForm.email.isNotValid ? 'invalid email' : null,
        ),
      );
    });
  }
}

class PasswordInput extends StatelessWidget {
  const PasswordInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return TextField(
        key: const Key('loginForm_passwordInput_textField'),
        onChanged: (password) => loginForm.newPassword = password,
        decoration: InputDecoration(
          labelText: 'password',
          errorText: loginForm.password.isNotValid ? 'invalid password' : null,
        ),
      );
    });
  }
}

class SubmitButton extends StatelessWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginForm>(builder: (context, loginForm, child) {
      return ElevatedButton(
        key: const Key('loginForm_continue_raisedButton'),
        onPressed: loginForm.isValid
            ? () {
                context.go("/home");
              }
            : () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(content: Text('Login Failure')),
                  );
              },
        child: const Text('LOGIN'),
      );
    });
  }
}
