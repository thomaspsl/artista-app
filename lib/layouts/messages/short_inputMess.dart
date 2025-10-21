import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';

class ShortInputMess extends StatefulWidget {
  const ShortInputMess({
    super.key,
    required this.text,
  });

  final String text;

  @override
  State<ShortInputMess> createState() => _ShortInputMessState();
}

class _ShortInputMessState extends State<ShortInputMess> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).indicatorColor,
      ),
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      width: MediaQuery.of(context).size.width,
      child: TextField(
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: Icon(
            Icons.send,
            color: Theme.of(context).cardColor,
          ),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          focusColor: Theme.of(context).indicatorColor,
          contentPadding: const EdgeInsets.only(top: 10),
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
          fillColor: Theme.of(context).indicatorColor,
        ),
        cursorColor: AppColors.orangeJuice,
        style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: FontWeight.w600,
          fontSize: 15,
        ),
      ),
    );
  }
}
