import 'package:flutter/material.dart';
import 'package:artista/modules/short_button.dart';
import 'package:artista/modules/short_input.dart';
import 'package:artista/config/artista.dart';

class ProblemContent extends StatefulWidget {
  const ProblemContent({super.key});

  @override
  State<ProblemContent> createState() => _ProblemContentState();
}

class _ProblemContentState extends State<ProblemContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: ShortInput(
              label: "Email",
              placeholder: "Email de votre compte",
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: ShortInput(
              label: "Description",
              placeholder: "Décrivez votre problème ici",
              maxLines: 2,
            ),
          ),
          ShortButton(
            color: AppColors.orangeJuice,
            name: "Envoyer",
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            onTap: () => {},
          ),
        ],
      ),
    );
  }
}
