import 'package:flutter/material.dart';
import 'package:artista/modules/short_button.dart';
import 'package:artista/modules/short_input.dart';
import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';

class PrivacyContent extends StatefulWidget {
  const PrivacyContent({super.key});

  @override
  State<PrivacyContent> createState() => _PrivacyContentState();
}

class _PrivacyContentState extends State<PrivacyContent> {
  late String old_password = '';
  late String new_password = '';
  late String confirm_password = '';

  void updateVariable(String variable, String newValue) {
    setState(() {
      switch (variable) {
        case 'old_password':
          old_password = newValue;
          break;
        case 'new_password':
          new_password = newValue;
          break;
        case 'confirm_password':
          confirm_password = newValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
        child: Column(children: [
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: ShortInput(
              label: "Mot de passe actuel",
              placeholder: "******",
              variable: 'old_password',
              searchValue: updateVariable,
              obscure: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: ShortInput(
              label: "Nouveau mot de passe",
              placeholder: "******",
              variable: 'new_password',
              searchValue: updateVariable,
              obscure: true,
            ),
          ),
          Container(
            padding: EdgeInsets.only(bottom: 15),
            child: ShortInput(
              label: "Confirmer nouveau mot de passe",
              placeholder: "******",
              variable: 'confirm_password',
              searchValue: updateVariable,
              obscure: true,
            ),
          ),
          ShortButton(
            color: AppColors.greenMint,
            name: "Sauvegarder",
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            onTap: () =>
                Controller.modifyPassword(context, old_password, new_password, confirm_password),
          ),
        ]));
  }
}
