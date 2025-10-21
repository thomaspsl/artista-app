import 'package:artista/managers/user_manager.dart';
import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HeaderBar extends StatelessWidget implements PreferredSizeWidget {
  const HeaderBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return AppBar(
      backgroundColor: Theme.of(context).backgroundColor,
      shadowColor: Theme.of(context).primaryColor,
      elevation: 0,
      centerTitle: true,

      //Left part
      leading: Container(
        padding: const EdgeInsets.only(top: 7, left: 10),
        child: (() {
          try {
            //Back Arrow
            if (context.canPop())
              return GestureDetector(
                onTap: () => GoRouter.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios_rounded,
                  color: Theme.of(context).primaryColor,
                  size: 25,
                ),
              );

            //Search
            if (!GoRouter.of(context).location.contains("/on-boarding"))
              return GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('search'),
                child: Icon(
                  Icons.search_outlined,
                  color: Theme.of(context).primaryColor,
                  size: 32,
                ),
              );
          } catch (e) {
            //Search
            return GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed('search'),
              child: Icon(
                Icons.search_outlined,
                color: Theme.of(context).primaryColor,
                size: 32,
              ),
            );
          }
        })(),
      ),

      //Center part
      title: GestureDetector(
        onTap: () => GoRouter.of(context).goNamed('home'),
        child: Text(
          'Artista',
          style: GoogleFonts.lobster(
            fontSize: 33,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),

      //Right part
      actions: [
        Container(
          padding: const EdgeInsets.only(top: 11, right: 20, bottom: 7),
          child: (() {
            try {
              //Me Profile
              if (!context.canPop() && !GoRouter.of(context).location.contains("/on-boarding"))
                return GestureDetector(
                  onTap: () => GoRouter.of(context).pushNamed('me'),
                  child: (userManager.auth_user != null)
                      ? ShortPicture(
                          url: userManager.auth_user['user']['profile_image'],
                          radius: 10,
                          size: 38,
                        )
                      : Container(),
                );

              //Settings
              if (context.canPop() &&
                  GoRouter.of(context).location.contains("/me") &&
                  !GoRouter.of(context).location.contains("/conversation/") &&
                  !GoRouter.of(context).location.contains("/edit"))
                return GestureDetector(
                  onTap: () => GoRouter.of(context).pushNamed('settings'),
                  child: Container(
                    padding: EdgeInsets.only(bottom: 2),
                    child: Icon(
                      Icons.settings_suggest_rounded,
                      color: Theme.of(context).primaryColor,
                      size: 32,
                    ),
                  ),
                );
            } catch (e) {
              //Me Profile
              return GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('me'),
                child: (userManager.auth_user != null)
                    ? ShortPicture(
                        url: userManager.auth_user['user']['profile_image'],
                        radius: 10,
                        size: 38,
                      )
                    : Container(),
              );
            }
          })(),
        )
      ],
    );
  }
}
