import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/web_service/retrieve_quizz_categories.dart';
import 'package:quizz_app_provider/widgets/buttons/home_contact_button.dart';
import 'package:quizz_app_provider/widgets/buttons/home_disconnect_button.dart';
import 'package:quizz_app_provider/widgets/stats/stats_division.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePage(
      appBarText: 'Bienvenue ${user.pseudo} !',
      appBarActions: const [HomeDisconnectButton()],
      floatingActionButton: const HomeContactButton(),
      child: const HomePageContent(),
    );
  }
}

class HomePageContent extends StatelessWidget with RetrieveQuizzCategories {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Column(
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
            const StatsDivision(),
          ],
        ),
      ],
    );
  }
}
