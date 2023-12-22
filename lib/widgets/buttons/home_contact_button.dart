import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeContactButton extends StatelessWidget {
  const HomeContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.go('/home/contacts');
      },
      child: const Icon(Icons.person),
    );
  }
}
