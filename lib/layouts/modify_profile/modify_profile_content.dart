import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_button.dart';
import 'package:artista/modules/short_input.dart';
import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ModifyProfileContent extends StatefulWidget {
  const ModifyProfileContent({super.key, required this.data});

  final dynamic data;

  @override
  State<ModifyProfileContent> createState() => _ModifyProfileContentState();
}

class _ModifyProfileContentState extends State<ModifyProfileContent> {
  late String pseudo = '';
  late String biographie = '';
  late String email = '';
  late String mobile = '';

  void updateVariable(String variable, String newValue) {
    setState(() {
      switch (variable) {
        case 'pseudo':
          pseudo = newValue;
          break;
        case 'biographie':
          biographie = newValue;
          break;
        case 'email':
          email = newValue;
          break;
        case 'mobile':
          mobile = newValue;
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 10),
            child: ShortPicture(
              url: userManager.auth_user['user']['profile_image'],
              radius: 30,
              size: 100,
            ),
          ),
          GestureDetector(
            onTap: () => {},
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "Télécharger",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  const WidgetSpan(
                    alignment: PlaceholderAlignment.middle,
                    child: Icon(Icons.file_download_rounded, size: 40),
                  ),
                ],
              ),
            ),
          ),
          ShortInput(
            label: "Pseudo",
            variable: 'pseudo',
            searchValue: updateVariable,
            placeholder: userManager.auth_user['user']['profile_user'],
          ),
          ShortInput(
            label: "Biographie",
            variable: 'biographie',
            searchValue: updateVariable,
            placeholder: userManager.auth_user['user']['caption_user'] ?? "",
            maxLines: 2,
          ),
          ShortInput(
            label: "Email",
            variable: 'email',
            searchValue: updateVariable,
            placeholder: userManager.auth_user['user']['mail_user'],
          ),
          ShortInput(
            label: "Mobile",
            variable: 'mobile',
            searchValue: updateVariable,
            placeholder: userManager.auth_user['user']['mobile_user'] ?? "",
          ),
          ShortButton(
            color: AppColors.greenMint,
            name: "Enregistrer",
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            onTap: () => Controller.modifyProfile(context, pseudo, email, biographie, mobile),
          ),
        ],
      ),
    );
  }
}
