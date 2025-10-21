import 'package:artista/modules/short_listElement.dart';
import 'package:flutter/material.dart';

class SettingsContent extends StatefulWidget {
  const SettingsContent({super.key});

  @override
  State<SettingsContent> createState() => _SettingsContentState();
}

class _SettingsContentState extends State<SettingsContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        child: Column(children: [
          ShortListElement(
            title: "Langue",
            id: "languages",
            icon: Icons.language,
            end_icon: Icons.arrow_forward_ios,
          ),
          ShortListElement(
            title: "Conditions d'utilisation",
            id: "conditions",
            icon: Icons.account_balance_outlined,
            end_icon: Icons.arrow_forward_ios,
          ),
          ShortListElement(
            title: "Paramètres du compte",
            id: "privacy",
            icon: Icons.settings,
            end_icon: Icons.arrow_forward_ios,
          ),
          ShortListElement(
            title: "Signaler un problème",
            id: "problem",
            icon: Icons.info_outline,
            end_icon: Icons.arrow_forward_ios,
          ),
        ]));
  }
}
