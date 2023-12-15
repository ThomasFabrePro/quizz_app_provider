import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:quizz_app_provider/login/authentication_status.dart';
import 'package:quizz_app_provider/login/models/login_form.dart';

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
                create: (context) => LoginForm(),
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

class AccountCreationLink extends StatelessWidget {
  const AccountCreationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('loginForm_createAccount_flatButton'),
      onTap: () => context.go('/login/account_creation'),
      child: const Text(
        'Create an account',
        style:
            TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
      ),
    );
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
