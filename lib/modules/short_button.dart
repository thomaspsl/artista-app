import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';

class ShortButton extends StatefulWidget {
  const ShortButton({
    super.key,
    required this.color,
    required this.name,
    required this.padding,
    required this.onTap,
  });

  final Color color;
  final String name;
  final EdgeInsetsGeometry padding;
  final Function()? onTap;

  @override
  State<ShortButton> createState() => _ShortButtonState();
}

class _ShortButtonState extends State<ShortButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Card(
        shape: const StadiumBorder(),
        color: widget.color,
        child: Container(
          padding: widget.padding,
          child: Text(
            widget.name,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: AppColors.whiteTitanium,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
