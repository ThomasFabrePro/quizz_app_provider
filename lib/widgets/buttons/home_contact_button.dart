import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';

class HomeContactButton extends StatelessWidget {
  const HomeContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeConfig.primaryColor,
      onPressed: () {
        context.go('/home/contacts');
      },
      child: const Icon(
        Icons.person,
        color: ThemeConfig.secondaryColor,
      ),
    );
  }
}
