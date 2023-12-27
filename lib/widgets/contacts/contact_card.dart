import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String pseudo;
  final IconButton trailing;
  const ContactCard({super.key, required this.pseudo, required this.trailing});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        // gradient: const LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [
        //       Color.fromRGBO(255, 255, 255, 0.25),
        //       Color.fromRGBO(255, 255, 255, 0.1),
        //     ]),
        color: Colors.white70,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.white30,
          width: 1,
        ),
      ),
      child: ListTile(
        title: Text(
          pseudo,
          // style: const TextStyle(color: Colors.white),
        ),
        trailing: trailing,
      ),
    );
  }
}
