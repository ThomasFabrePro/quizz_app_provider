import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AccountCreationLink extends StatelessWidget {
  const AccountCreationLink({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      key: const Key('loginForm_createAccount_flatButton'),
      onTap: () => context.go('/login/account_creation'),
      child: const Text(
        'Créer un compte',
        style:
            TextStyle(color: Colors.blue, decoration: TextDecoration.underline),
      ),
    );
  }
}
