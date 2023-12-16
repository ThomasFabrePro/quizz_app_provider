import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/app.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/login/widgets/custom_shaped_containers/default_background.dart';
import 'package:quizz_app_provider/login/widgets/custom_shaped_containers/login_background.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';

class HomePage extends StatelessWidget with DisconnectUser {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Accueil !',
            style: TextStyle(
                color: ThemeConfig.primaryColor,
                fontSize: ThemeConfig.appBarFontSize)),
        backgroundColor: Colors.transparent,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: Container(
                decoration: const BoxDecoration(
                  color: ThemeConfig.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.logout,
                      color: ThemeConfig.tertiaryColor),
                  onPressed: () {
                    disconnectUser();
                    context.go('/login');
                  },
                )),
          )
        ],
      ),
      body: Center(
        child: Container(
          constraints: const BoxConstraints(maxWidth: ThemeConfig.maxWidth),
          child: Stack(
            children: [
              Positioned(
                top: 0,
                child: RepaintBoundary(
                  child: CustomPaint(
                    painter: DefaultBackground(),
                    size: const Size(
                        ThemeConfig.maxWidth, ThemeConfig.maxWidth * 2),
                  ),
                ),
              ),
              const SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: HomePageContent(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton(
            onPressed: () {
              context.go('/home/quizz_selection');
            },
            child: const Text(
              'Jouer !',
              style: ThemeConfig.elevatedButtonTextStyle,
            )),
      ],
    );
  }
}
