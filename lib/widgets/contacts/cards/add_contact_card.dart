import 'package:flutter/material.dart';
import 'package:quizz_app_provider/common/theme.dart';

class AddContactCard extends StatelessWidget {
  final String pseudo;
  final Function onPressedAdd;
  final Function onPressedRemove;
  const AddContactCard(
      {super.key,
      required this.pseudo,
      required this.onPressedAdd,
      required this.onPressedRemove});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromRGBO(255, 255, 255, 0.25),
              Color.fromRGBO(255, 255, 255, 0.1),
            ]),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white30,
          width: 1,
        ),
      ),
      child: ListTile(
        title: Text(
          pseudo,
          style: const TextStyle(color: Colors.white),
        ),
        leading: IconButton(
          icon: const Icon(Icons.delete, color: Colors.red, size: 30),
          onPressed: () {
            onPressedRemove();
            // await user.acceptContactInvitation(contact);
          },
        ),
        trailing: IconButton(
          icon:
              const Icon(Icons.add, color: ThemeConfig.primaryColor, size: 30),
          onPressed: () {
            onPressedAdd();
            // await user.acceptContactInvitation(contact);
          },
        ),
      ),
    );
  }
}
