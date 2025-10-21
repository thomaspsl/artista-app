import 'package:flutter/material.dart';
import 'package:artista/modules/short_inputSearch.dart';
import 'package:artista/modules/short_listElement.dart';

class LanguagesContent extends StatefulWidget {
  const LanguagesContent({super.key});

  @override
  State<LanguagesContent> createState() => _LanguagesContentState();
}

class _LanguagesContentState extends State<LanguagesContent> {
  late String search = '';

  void updateVariable(String variable, String newValue) {
    setState(() {
      switch (variable) {
        case 'search':
          search = newValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).backgroundColor,
        padding: EdgeInsets.all(16.0),
        child: Column(children: [
          ShortInputSearch(text: "Rechercher", variable: "search", searchValue: updateVariable),
          ShortListElement(
            title: "Français",
            id: "french",
            icon: "🇫🇷",
            end_icon: Icons.check_outlined,
          ),
          ShortListElement(
            title: "Anglais",
            id: "english",
            icon: "🇬🇧",
            end_icon: Icons.arrow_forward_ios,
          )
        ]));
  }
}
