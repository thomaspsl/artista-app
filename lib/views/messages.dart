import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/error_content.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/messages/messages_content.dart';
import 'package:flutter/material.dart';

class Messages extends StatelessWidget {
  const Messages({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  final String from;
  final String to;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getData(context, "/conversation/${from}/${to}"),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // If the API call was successful, build the ListView
          return MessagesContent(data: snapshot.data);
          // If the API call was errorful, return error
        } else if (snapshot.hasError) {
          // If the API call was unsuccessful, display an error message
          return ErrorContent(content: snapshot.error);
        }
        // If the data is still being loaded, show a loading indicator
        return LoadContent();
      },
    );
  }
}
