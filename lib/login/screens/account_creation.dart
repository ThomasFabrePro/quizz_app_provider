import 'package:flutter/material.dart';

class AccountCreation extends StatelessWidget {
  const AccountCreation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Account Creation'),
      ),
      body: const Center(
        child: Text('Account Creation'),
      ),
    );
  }
}
