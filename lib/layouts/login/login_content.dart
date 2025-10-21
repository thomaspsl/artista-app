import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/modules/short_button.dart';
import 'package:artista/modules/short_input.dart';
import 'package:flutter/material.dart';

class LoginContent extends StatefulWidget {
  const LoginContent({super.key});

  @override
  State<LoginContent> createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {
  late String mail = '';
  late String password = '';

  void updateVariable(String variable, String newValue) {
    setState(() {
      switch (variable) {
        case 'mail':
          mail = newValue;
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
      padding: const EdgeInsets.symmetric(vertical: 55),
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
                      "Connexion",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  ShortInput(
                    label: "Email",
                    placeholder: "example@domain.com",
                    variable: 'mail',
                    searchValue: updateVariable,
                  ),
                  ShortInput(
                    label: "Mot de passe",
                    placeholder: "**********",
                    variable: 'password',
                    searchValue: updateVariable,
                    obscure: true,
                  ),
                  GestureDetector(
                    onTap: () => {},
                    child: Center(
                      child: Text(
                        "Mot de passe oublié ?",
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),
                  ShortButton(
                    color: AppColors.orangeJuice,
                    name: "Se connecter",
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    onTap: () => Controller.login(context, mail, password),
                  ),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ShortButton(
                color: Theme.of(context).indicatorColor,
                name: "Google",
                padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                onTap: () => Controller.login(context, mail, password),
              ),
              ShortButton(
                color: Theme.of(context).indicatorColor,
                name: "Facebook",
                padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                onTap: () => Controller.login(context, mail, password),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
