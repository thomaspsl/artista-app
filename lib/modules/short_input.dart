import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';

class ShortInput extends StatefulWidget {
  const ShortInput({
    super.key,
    required this.label,
    required this.placeholder,
    this.variable,
    this.searchValue,
    this.maxLines = 1,
    this.obscure = false,
  });

  final String label;
  final String? variable;
  final Function(String, String)? searchValue;
  final String placeholder;
  final int maxLines;
  final bool obscure;

  @override
  State<ShortInput> createState() => _ShortInput();
}

class _ShortInput extends State<ShortInput> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 5),
          child: Text(
            widget.label,
            style: TextStyle(
              color: Theme.of(context).cardColor,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
        TextField(
          obscureText: widget.obscure,
          onChanged: (value) => widget.searchValue!(widget.variable!, value),
          autofocus: false,
          scrollPhysics: const ScrollPhysics(),
          maxLines: widget.maxLines,
          textInputAction: TextInputAction.next,
          minLines: 1,
          style: const TextStyle(
            fontSize: 15,
          ),
          cursorColor: AppColors.orangeJuice,
          decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.always,
            focusColor: Theme.of(context).indicatorColor,
            contentPadding: const EdgeInsets.only(left: 12, top: 30, right: 12),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: const BorderSide(color: Colors.transparent),
            ),
            filled: true,
            hintStyle: TextStyle(color: Theme.of(context).cardColor),
            hintText: widget.placeholder,
            fillColor: Theme.of(context).indicatorColor,
          ),
        ),
      ],
    );
  }
}
