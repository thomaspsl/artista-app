import 'package:flutter/material.dart';
import 'package:artista/layouts/details_collection/short_collection_picture.dart';

class DetailsCollectionsContent extends StatefulWidget {
  const DetailsCollectionsContent({
    super.key,
    this.data,
  });

  final dynamic data;

  @override
  State<DetailsCollectionsContent> createState() =>
      _DetailsCollectionsContentState();
}

class _DetailsCollectionsContentState extends State<DetailsCollectionsContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(
        top: 10,
        left: 20,
        right: 20,
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 15),
            child: Row(
              children: [
                Text(
                  "La collection : " + widget.data['user']['name'],
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
            ),
            shrinkWrap: true,
            itemCount: widget.data['user']['posts'].length,
            itemBuilder: (context, index) {
              return ShortCollectionPicture(
                uuid: widget.data['user']['posts'][index]['uuid'],
                image_url: widget.data['user']['posts'][index]['image'],
              );
            },
          ),
        ],
      ),
    );
  }
}
