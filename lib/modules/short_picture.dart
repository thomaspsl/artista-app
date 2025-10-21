import 'package:flutter/material.dart';

class ShortPicture extends StatefulWidget {
  const ShortPicture({
    super.key,
    required this.url,
    required this.radius,
    required this.size,
  });

  final String url;
  final double radius;
  final double size;

  @override
  State<ShortPicture> createState() => _ShortPictureState();
}

class _ShortPictureState extends State<ShortPicture> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(widget.radius),
      child: SizedBox.fromSize(
        size: Size.square(widget.size),
        child: Image.network(
          widget.url,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
