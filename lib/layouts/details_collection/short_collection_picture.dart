import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShortCollectionPicture extends StatefulWidget {
  const ShortCollectionPicture({
    super.key,
    required this.image_url,
    required this.uuid,
  });

  final String image_url;
  final String uuid;

  @override
  State<ShortCollectionPicture> createState() => _ShortCollectionPicture();
}

class _ShortCollectionPicture extends State<ShortCollectionPicture> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          GoRouter.of(context).pushNamed('post', params: {'uuid': widget.uuid}),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        child: ShortPicture(
          url: widget.image_url,
          radius: 17,
          size: 100,
        ),
      ),
    );
  }
}
