import 'package:artista/config/artista.dart';
import 'package:flutter/material.dart';

class ShortInputSearch extends StatefulWidget {
  const ShortInputSearch({
    super.key,
    required this.text,
    required this.variable,
    required this.searchValue,
  });

  final String text;
  final String variable;
  final Function(String, String) searchValue;

  @override
  State<ShortInputSearch> createState() => _ShortInputSearchState();
}

class _ShortInputSearchState extends State<ShortInputSearch> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Theme.of(context).indicatorColor,
      ),
      padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
      width: MediaQuery.of(context).size.width / 1.35,
      child: TextField(
        onChanged: (value) => widget.searchValue(widget.variable, value),
        decoration: InputDecoration(
          hintText: widget.text,
          suffixIcon: Icon(
            Icons.search,
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
