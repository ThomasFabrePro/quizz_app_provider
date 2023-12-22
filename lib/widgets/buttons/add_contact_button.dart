import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';

class AddContactButton extends StatelessWidget {
  const AddContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeConfig.primaryColor,
      onPressed: () {
        // context.go('/home/contacts/add_contact');
      },
      child: const Icon(
        Icons.add,
        color: ThemeConfig.secondaryColor,
      ),
    );
  }
}
