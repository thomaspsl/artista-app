import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ShortSlidingUp extends StatefulWidget {
  const ShortSlidingUp({
    super.key,
    required this.body,
    required this.panel,
  });

  final Widget? body;
  final Widget? panel;

  @override
  State<ShortSlidingUp> createState() => _ShortSlidingUpState();
}

class _ShortSlidingUpState extends State<ShortSlidingUp> {
  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      body: widget.body,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(15),
        topRight: Radius.circular(15),
      ),
      parallaxEnabled: true,
      backdropEnabled: true,
      parallaxOffset: 0.3,
      minHeight: 125,
      maxHeight: 340,
      color: Theme.of(context).backgroundColor,
      panel: widget.panel,
    );
  }
}
