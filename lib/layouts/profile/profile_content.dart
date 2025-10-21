import 'package:artista/config/artista.dart';
import 'package:artista/config/controller.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_button.dart';
import 'package:artista/modules/short_collection.dart';
import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

class ProfileContent extends StatefulWidget {
  const ProfileContent({
    super.key,
    required this.data,
    required this.uuid,
  });

  final dynamic data;
  final String uuid;

  @override
  State<ProfileContent> createState() => _ProfileContentState();
}

class _ProfileContentState extends State<ProfileContent> {
  Color buttonColor = AppColors.orangeJuice;
  String buttonText = "S'abonner";

  void changeButtonState() {
    setState(() {
      if (buttonColor == AppColors.orangeJuice) {
        buttonColor = Theme.of(context).indicatorColor;
        buttonText = "Se désabonner";
      } else {
        buttonColor = AppColors.orangeJuice;
        buttonText = "S'abonner";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ShortPicture(
                        url: widget.data['user']['profile_image'],
                        radius: 30,
                        size: 100,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        widget.data['user']['profile_user'],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: Text(
                        widget.data['user']['pseudo_user'],
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Theme.of(context).cardColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    Text(
                      widget.data['user']['caption_user'] ?? "Ajouter une description",
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Theme.of(context).cardColor,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    Controller.formatNumber(widget.data['user']['share_user']),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Partages",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Controller.formatNumber(widget.data['user']['sub_user']),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "Abonnés",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Text(
                    Controller.formatNumber(widget.data['user']['like_user']),
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    "J'aime",
                    style: TextStyle(
                      color: Theme.of(context).cardColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ],
          ),
          if (userManager.auth_user['user']['uuid'] == widget.uuid)
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShortButton(
                    color: AppColors.orangeJuice,
                    name: "Modifier profil",
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    onTap: () => GoRouter.of(context).pushNamed('edit'),
                  ),
                  ShortButton(
                    color: AppColors.redLava,
                    name: "Se déconnecter",
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    onTap: () => Controller.logout(context),
                  ),
                ],
              ),
            )
          else
            Container(
              padding: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ShortButton(
                    color: buttonColor,
                    name: buttonText,
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    onTap: () => changeButtonState(),
                  ),
                  ShortButton(
                    color: Theme.of(context).indicatorColor,
                    name: "Message",
                    padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                    onTap: () => {},
                  ),
                ],
              ),
            ),
          Container(
            height: 260,
            child: GridView.builder(
              physics: const BouncingScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
              ),
              shrinkWrap: true,
              itemCount: widget.data['user']['collections'].length,
              itemBuilder: (context, index) {
                int length = widget.data['user']['collections'][index]['posts'].length;

                return ShortCollection(
                  uuid: widget.data['user']['collections'][index]['uuid'],
                  image1_url: (length - 1 >= 0)
                      ? widget.data['user']['collections'][index]['posts'][0]['image']
                      : "",
                  image2_url: (length - 1 >= 1)
                      ? widget.data['user']['collections'][index]['posts'][1]['image']
                      : "",
                  image3_url: (length - 1 >= 2)
                      ? widget.data['user']['collections'][index]['posts'][2]['image']
                      : "",
                  image4_url: (length - 1 >= 3)
                      ? widget.data['user']['collections'][index]['posts'][3]['image']
                      : "",
                  collection_name: widget.data['user']['collections'][index]['name'],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
