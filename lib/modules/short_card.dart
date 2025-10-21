import 'package:flutter/material.dart';

class ShortCard extends StatefulWidget {
  const ShortCard({
    super.key,
    required this.size,
    required this.color,
    required this.radius,
    this.child,
  });

  final double size;
  final Color color;
  final double radius;
  final Widget? child;

  @override
  State<ShortCard> createState() => _ShortCardState();
}

class _ShortCardState extends State<ShortCard> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: widget.size,
          height: widget.size,
          child: Card(
            color: widget.color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(widget.radius),
            ),
            child: widget.child,
          ),
        ),
      ],
    );
  }
}
