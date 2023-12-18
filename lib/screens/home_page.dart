import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/screens/base_page.dart';
import 'package:quizz_app_provider/screens/quizz/quizz_selection.dart';
import 'package:quizz_app_provider/web_service/retrieve_quizz_categories.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';

class HomePage extends StatelessWidget with DisconnectUser {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBarText: 'Accueil !',
      appBarActions: [
        Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
              decoration: const BoxDecoration(
                color: ThemeConfig.primaryColor,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon:
                    const Icon(Icons.logout, color: ThemeConfig.tertiaryColor),
                onPressed: () {
                  disconnectUser();
                  context.go('/login');
                },
              )),
        )
      ],
      child: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget with RetrieveQuizzCategories {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              retrieveQuizzCategories().then((value) {
                if (value.isNotEmpty) {
                  context.go('/home/quizz_selection', extra: value);
                } else {
                  ScaffoldMessenger.of(context)
                    ..hideCurrentSnackBar()
                    ..showSnackBar(
                      const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('Aucun quizz disponible')),
                    );
                }
              });
            },
            child: const Text(
              'Jouer !',
              style: ThemeConfig.elevatedButtonTextStyle,
            )),
      ],
    );
  }
}
