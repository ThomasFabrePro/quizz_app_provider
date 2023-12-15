import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/app.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              context.go('/login');
            },
          )
        ],
      ),
      body: Center(
        child: Text('Bienvenue ${user.pseudo}'),
      ),
    );
  }
}
