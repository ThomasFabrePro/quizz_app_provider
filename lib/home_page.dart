import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/app.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';

class HomePage extends StatelessWidget with DisconnectUser {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Accueil !',
            style: TextStyle(color: ThemeConfig.primaryColor)),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () {
              disconnectUser();
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
