import 'package:artista/config/controller.dart';
import 'package:artista/layouts/app/footer_bar.dart';
import 'package:artista/layouts/app/header_bar.dart';
import 'package:flutter/material.dart';

class AppContent extends StatefulWidget {
  const AppContent({super.key, required this.content});

  final Widget content;

  @override
  State<AppContent> createState() => _AppContentState();

  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class _AppContentState extends State<AppContent> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: const HeaderBar(),
      body: Controller.getAppContent(context, widget.content),
      bottomNavigationBar: const FooterBar(),
    );
  }
}
