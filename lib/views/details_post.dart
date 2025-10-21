import 'package:artista/config/api.dart';
import 'package:artista/layouts/app/error_content.dart';
import 'package:artista/layouts/app/load_content.dart';
import 'package:artista/layouts/details_post/details_post_content.dart';
import 'package:flutter/material.dart';

class DetailsPost extends StatelessWidget {
  const DetailsPost({
    Key? key,
    required this.uuid,
  }) : super(key: key);

  final String uuid;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Api.getData(context, "/post/" + uuid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // If the API call was successful, build the ListView
          return DetailsPostContent(data: snapshot.data);
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
