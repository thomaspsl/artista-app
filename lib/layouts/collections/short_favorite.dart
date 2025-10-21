import 'package:artista/modules/short_picture.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ShortFavorite extends StatefulWidget {
  const ShortFavorite({
    super.key,
    required this.image_url,
    required this.uuid,
  });

  final String uuid;
  final String image_url;

  @override
  State<ShortFavorite> createState() => _ShortFavorite();
}

class _ShortFavorite extends State<ShortFavorite> {
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
