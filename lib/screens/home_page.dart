import 'package:flutter/material.dart';
import 'package:quizz_app_provider/models/persons/user.dart';
import 'package:quizz_app_provider/screens/base/base_page.dart';
import 'package:quizz_app_provider/widgets/buttons/home_contact_button.dart';
import 'package:quizz_app_provider/widgets/buttons/home_disconnect_button.dart';
import 'package:quizz_app_provider/widgets/buttons/solo_quizz_button.dart';
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

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SoloQuizzButton(),
            StatsDivision(),
          ],
        ),
      ],
    );
  }
}
