import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:quizz_app_provider/common/theme.dart';
import 'package:quizz_app_provider/models/persons/user.dart';

class PendingContactInvitation extends StatelessWidget {
  const PendingContactInvitation({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: ThemeConfig.primaryColor,
      onPressed: () {
        context.go('/home/contacts/pending_contact_invitations');
      },
      child: Badge(
        label: Text(user.pendingContactInvitations.length.toString()),
        offset: const Offset(10, -5),
        isLabelVisible: user.pendingContactInvitations.isNotEmpty,
        child:
            const Icon(Icons.question_mark, color: ThemeConfig.secondaryColor),
      ),
    );
  }
}
