import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/error_content.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/notifications/notifications_content.dart';
import 'package:artista/managers/user_manager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var userManager = Provider.of<UserManager>(context, listen: true);

    return FutureBuilder(
      future: Api.getData(context, "/notifications/${userManager.auth_user['user']['uuid']}"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // If the API call was successful, build the ListView
          return NotificationsContent(data: snapshot.data);
          // If the API call was errorful, return error
        } else if (snapshot.hasError) {
          // If the API call was unsuccessful, display an error message
          return ErrorContent(content: snapshot.error);
        }
        // If the data is still being loaded, show a loading indicator
        return LoadContent();
      },
    );
    // return Container(
    //   color: Theme.of(context).backgroundColor,
    //   child: Center(
    //     child: Text(
    //       'Travaux en cours',
    //       textAlign: TextAlign.center,
    //       style: TextStyle(
    //         color: Theme.of(context).primaryColor,
    //         fontSize: 15,
    //         fontWeight: FontWeight.bold,
    //       ),
    //     ),
    //   ),
    // );
    // return NotificationsContent();
  }
}
