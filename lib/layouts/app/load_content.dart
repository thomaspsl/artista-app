import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';

class LoadContent extends StatefulWidget {
  const LoadContent({super.key});

  @override
  State<LoadContent> createState() => _LoadContentState();
}

class _LoadContentState extends State<LoadContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).backgroundColor,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.orangeJuice,
        ),
      ),
    );
  }
}
