import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/modules/short_button.dart';
import 'package:artista/modules/short_input.dart';
import 'package:flutter/material.dart';

class RegisterContent extends StatefulWidget {
  const RegisterContent({super.key});

  @override
  State<RegisterContent> createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {
  late String pseudo = '';
  late String identifiant = '';
  late String email = '';
  late String password = '';

  void updateVariable(String variable, String newValue) {
    setState(() {
      switch (variable) {
        case 'pseudo':
          pseudo = newValue;
          break;
        case 'identifiant':
          identifiant = newValue;
          break;
        case 'email':
          email = newValue;
          break;
        case 'password':
          password = newValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(top: 40, bottom: 55),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Image.asset(
              "lib/assets/pictures/login.png",
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 60),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Center(
                    child: Text(
                      "Inscription",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ShortInput(
                    label: "Pseudo",
                    placeholder: "example",
                    variable: 'pseudo',
                    searchValue: updateVariable,
                  ),
                  ShortInput(
                    label: "Identifiant",
                    placeholder: "@example",
                    variable: 'identifiant',
                    searchValue: updateVariable,
                  ),
                  ShortInput(
                    label: "Email",
                    placeholder: "example@domain.com",
                    variable: 'email',
                    searchValue: updateVariable,
                  ),
                  ShortInput(
                    label: "Mot de passe",
                    placeholder: "**********",
                    variable: 'password',
                    searchValue: updateVariable,
                    obscure: true,
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShortButton(
                color: AppColors.orangeJuice,
                name: "S'inscrire",
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                onTap: () =>
                    Controller.autoLoginOnRegister(context, pseudo, identifiant, email, password),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
