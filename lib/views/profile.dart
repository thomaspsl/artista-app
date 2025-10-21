import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/error_content.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/profile/profile_content.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Profile extends StatelessWidget {
  const Profile({
    Key? key,
    this.uuid,
  }) : super(key: key);

  final String? uuid;

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    if (uuid != null) {
      return FutureBuilder(
        future: Api.getData(context, "/user/" + uuid!),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // If the API call was successful, build the ListView
            return ProfileContent(data: snapshot.data, uuid: uuid!);
            // If the API call was errorful, return error
          } else if (snapshot.hasError) {
            // If the API call was unsuccessful, display an error message
            return ErrorContent(content: snapshot.error);
          }
          // If the data is still being loaded, show a loading indicator
          return LoadContent();
        },
      );
    } else {
      // If the account is the authenticated user
      return ProfileContent(
          data: userManager.auth_user, uuid: userManager.auth_user['user']['uuid']);
    }
  }
}
