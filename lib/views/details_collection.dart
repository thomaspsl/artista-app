import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/error_content.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/details_collection/details_collection_content.dart';
import 'package:flutter/material.dart';

class DetailsCollection extends StatelessWidget {
  const DetailsCollection({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getData(context, "/collection/" + uuid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // If the API call was successful, build the ListView
          return DetailsCollectionsContent(data: snapshot.data);
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
