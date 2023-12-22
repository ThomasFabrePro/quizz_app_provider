import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/web_service/web_service.dart';

class HomeDisconnectButton extends StatelessWidget with DisconnectUser {
  const HomeDisconnectButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Container(
          decoration: const BoxDecoration(
            color: ThemeConfig.primaryColor,
            shape: BoxShape.circle,
          ),
          child: IconButton(
            icon: const Icon(Icons.logout, color: ThemeConfig.tertiaryColor),
            onPressed: () {
              disconnectUser();
              context.go('/login');
            },
          )),
    );
  }
}
